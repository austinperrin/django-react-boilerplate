#!/usr/bin/env bash
set -euo pipefail

docker compose -f infra/docker/docker-compose.dev.yml up -d backend
docker compose -f infra/docker/docker-compose.dev.yml exec backend ruff check /app
docker compose -f infra/docker/docker-compose.dev.yml exec backend black --check /app
