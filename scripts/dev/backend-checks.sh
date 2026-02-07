#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"

docker compose -f "${REPO_ROOT}/infra/docker/docker-compose.dev.yml" up -d backend
docker compose -f "${REPO_ROOT}/infra/docker/docker-compose.dev.yml" exec backend sh -lc "cd /app && ruff check ."
docker compose -f "${REPO_ROOT}/infra/docker/docker-compose.dev.yml" exec backend sh -lc "cd /app && black --check ."
docker compose -f "${REPO_ROOT}/infra/docker/docker-compose.dev.yml" exec backend python manage.py check
docker compose -f "${REPO_ROOT}/infra/docker/docker-compose.dev.yml" exec backend python manage.py test
docker compose -f "${REPO_ROOT}/infra/docker/docker-compose.dev.yml" exec backend mypy --config-file /repo/pyproject.toml /app
