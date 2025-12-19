#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/../.." && pwd)

copy_env() {
  local src="$1"
  local dest="$2"
  if [ -f "$dest" ]; then
    echo "[skip] $dest already exists"
  elif [ -f "$src" ]; then
    cp "$src" "$dest"
    echo "[ok] created $dest from template"
  else
    echo "[warn] template $src not found"
  fi
}

copy_env "$REPO_ROOT/configs/env/.env.backend.example" "$REPO_ROOT/.env.backend"
copy_env "$REPO_ROOT/configs/env/.env.frontend.example" "$REPO_ROOT/.env.frontend"

echo "Bootstrap complete. Update .env files with real values and run docker compose when ready."
