ifneq (,$(wildcard ./venv))
    include .venv
    export
endif


compose-build:
	$(DOCKER_COMPOSE) build

# Default target
.PHONY: develop
develop: compose-build start
	$(DOCKER_COMPOSE) logs -f

.PHONY: develop-prod
develop-prod: compose-build start
	$(DOCKER_COMPOSE) logs -f

.PHONY: start
start:start
	$(DOCKER_COMPOSE) up -d


.PHONY: install run-server migrate migrations superuser update

install:
	poetry install --no-root

run-server:
	poetry run python -m core.manage runserver

migrate:
	poetry run python -m core.manage migrate

migrations:
	poetry run python -m core.manage makemigrations

superuser:
	poetry run python -m core.manage createsuperuser

.Phony: up-dependencies-only
up-dependencies-only:
	test -f .env || touch .env
	docker-compose -f docker-compose.dev.yml up --force-recreate db
update: install migrations migrate

