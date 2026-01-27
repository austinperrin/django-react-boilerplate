#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"

docker compose -f "${REPO_ROOT}/infra/docker/docker-compose.dev.yml" --profile frontend up -d frontend
docker compose -f "${REPO_ROOT}/infra/docker/docker-compose.dev.yml" --profile frontend exec frontend sh -lc "cd /repo && npm install"
docker compose -f "${REPO_ROOT}/infra/docker/docker-compose.dev.yml" --profile frontend exec frontend sh -lc "cd /repo && npm --workspace frontend run lint"
docker compose -f "${REPO_ROOT}/infra/docker/docker-compose.dev.yml" --profile frontend exec frontend sh -lc "cd /repo && npm --workspace frontend run format:check"
docker compose -f "${REPO_ROOT}/infra/docker/docker-compose.dev.yml" --profile frontend exec frontend sh -lc "cd /repo && npm --workspace frontend run test"
