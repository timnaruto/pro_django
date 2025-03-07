install:
	poetry install

run-server:
	poetry run python -m core.manage runserver

migrate:
	poetry run python -m core.manage migrate

migrations:
	poetry run python -m core.manage makemigrations

superuser:
	poetry run python -m core.manage createsuperuser

update: install migrate migrations ;