.PHONY: setup install db-migrate build prepare-env start dev start-backend start-frontend lint lint-fix test ci	

setup: install db-migrate
	@echo "Setup complete!"	

install:
	npm install	

db-migrate:
	npm run migrate	

build:
	npm run build	

prepare-env:
	cp -n .env.example .env	

start:
	NODE_ENV=production npm run start	

dev:
	npx concurrently "make start-frontend" "make start-backend"	

start-backend:
	npm start -- --watch --verbose-watch --ignore-watch='node_modules .git .sqlite'	

start-frontend:
	npx webpack --watch --progress	

lint:
	npx eslint .	

lint-fix:
	npx eslint --fix .	

test:
	NODE_ENV=test npm test -s	

ci:
 @code=0; \
 COMPOSE_FILE=../docker-compose.yml docker compose build --no-cache app || true; \
 COMPOSE_FILE=../docker-compose.yml docker compose up --abort-on-container-exit --exit-code-from app || code=$$?; \
 COMPOSE_FILE=../docker-compose.yml docker compose down --volumes --remove-orphans || true; \
 exit $$code
