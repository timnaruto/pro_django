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

update: install migrations migrate
