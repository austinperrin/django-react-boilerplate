#!/usr/bin/env bash
set -euo pipefail

docker compose -f infra/docker/docker-compose.dev.yml up -d backend
docker compose -f infra/docker/docker-compose.dev.yml exec backend python manage.py check
docker compose -f infra/docker/docker-compose.dev.yml exec backend python manage.py test
docker compose -f infra/docker/docker-compose.dev.yml exec backend mypy --config-file /repo/pyproject.toml /app
