init:
	docker run -v $(pwd)/app:/app -w /app composer:2.6.3 composer create-project symfony/skeleton:"6.3.*" /app
