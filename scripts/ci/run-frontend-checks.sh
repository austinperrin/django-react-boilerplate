#!/usr/bin/env bash
set -euo pipefail

docker compose -f infra/docker/docker-compose.dev.yml --profile frontend up -d frontend
docker compose -f infra/docker/docker-compose.dev.yml --profile frontend exec frontend sh -lc "cd /repo && npm install"
docker compose -f infra/docker/docker-compose.dev.yml --profile frontend exec frontend sh -lc "cd /repo && npm --workspace frontend run lint"
docker compose -f infra/docker/docker-compose.dev.yml --profile frontend exec frontend sh -lc "cd /repo && npm --workspace frontend run format:check"
docker compose -f infra/docker/docker-compose.dev.yml --profile frontend exec frontend sh -lc "cd /repo && npm --workspace frontend run test"
