FROM composer:2.6.3  as vendors

WORKDIR /app

COPY ./app/composer.json .

RUN composer install --ignore-platform-reqs --no-scripts


FROM php:8.2-fpm

WORKDIR /app

RUN apt-get update && \
    apt-get install -y nano vim tree git libzip-dev zip gnupg && \
    docker-php-ext-configure zip && \
    docker-php-ext-install zip && \
    docker-php-ext-install pdo_mysql && \
    docker-php-ext-install mysqli && \
    docker-php-ext-install bcmath && \
    pecl install xdebug && \
    docker-php-ext-enable xdebug

COPY --from=vendors /app/vendor ./vendor
