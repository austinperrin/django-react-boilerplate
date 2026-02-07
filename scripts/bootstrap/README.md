# Bootstrap Scripts

Use this folder for scripts that prepare local or tenant-specific environments (install dependencies, seed databases, generate keys).

## Ideas

- `dev.sh`: copy `.env` templates, generate `DJANGO_SECRET_KEY` when missing or placeholder, and support `--rotate-secret` for forced rotation.
- `tenant-seed.py`: create initial tenant, admin user, and portal configurations via backend API/management commands.
- `sync-config.sh`: pull latest shared configs from `configs/` into service directories.

Document interpreter requirements and environment variables for each script.
