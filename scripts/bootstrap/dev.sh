#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/../.." && pwd)
ROTATE_SECRET=false

usage() {
  cat <<'EOF'
Usage: scripts/bootstrap/dev.sh [--rotate-secret]

Options:
  --rotate-secret   Generate a new DJANGO_SECRET_KEY even if one exists.
EOF
}

for arg in "$@"; do
  case "$arg" in
    --rotate-secret) ROTATE_SECRET=true ;;
    -h|--help) usage; exit 0 ;;
    *) echo "[error] unknown option: $arg"; usage; exit 1 ;;
  esac
done

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

ensure_django_secret() {
  local env_file="$REPO_ROOT/.env.backend"
  if [ ! -f "$env_file" ]; then
    return
  fi

  local current_secret
  current_secret=$(
    rg -n '^DJANGO_SECRET_KEY=' "$env_file" \
      | head -n 1 \
      | cut -d= -f2- \
      || true
  )

  if [ "$ROTATE_SECRET" = true ] \
    || [ -z "$current_secret" ] \
    || [ "$current_secret" = "replace_me_with_a_very_secret_value" ]; then
    local secret
    secret=$("$REPO_ROOT/scripts/utilities/generate-django-secret.py")

    python3 - "$env_file" "$secret" <<'PY'
import sys

path, secret = sys.argv[1], sys.argv[2]
with open(path, "r", encoding="utf-8") as handle:
    lines = handle.readlines()

updated = False
for index, line in enumerate(lines):
    if line.startswith("DJANGO_SECRET_KEY="):
        lines[index] = f"DJANGO_SECRET_KEY={secret}\n"
        updated = True
        break

if not updated:
    lines.append(f"DJANGO_SECRET_KEY={secret}\n")

with open(path, "w", encoding="utf-8") as handle:
    handle.writelines(lines)
PY

    if [ "$ROTATE_SECRET" = true ]; then
      echo "[ok] rotated DJANGO_SECRET_KEY in $env_file"
    else
      echo "[ok] generated DJANGO_SECRET_KEY in $env_file"
    fi
  else
    echo "[skip] DJANGO_SECRET_KEY already set"
  fi
}

copy_env "$REPO_ROOT/configs/env/.env.backend.example" "$REPO_ROOT/.env.backend"
copy_env "$REPO_ROOT/configs/env/.env.frontend.example" "$REPO_ROOT/.env.frontend"
ensure_django_secret

echo "Bootstrap complete. Update .env files with real values and run docker compose when ready."
