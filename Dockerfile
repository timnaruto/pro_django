FROM python:3.10-slim
# Set the working directory
WORKDIR .


ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV PYTHONPATH .
ENV CORESETTINGS_IN_DOCKER True


# Install dependencies
RUN set -ex \
    && apt-get update \
    && apt-get install -y --no-install-recommends build-essential \
    && pip install --upgrade pip \
    && pip install virtualenvwrapper poetry \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


COPY ["pyproject.toml", "poetry.lock", "./"]
RUN poetry install

# Copy the current directory contents into the container at /app
COPY ["README.md", "Makefile", "./"]
COPY core core
COPY local local

EXPOSE 8000

# ENTRYPOINT ["make"]
COPY scripts/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
# Run app.py when the container launches
CMD ["make", "run"]