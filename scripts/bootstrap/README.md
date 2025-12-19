# Bootstrap Scripts

Use this folder for scripts that prepare local or tenant-specific environments (install dependencies, seed databases, generate keys).

## Ideas

- `dev.sh`: install tooling, copy `.env` templates, start Docker Compose.
- `tenant-seed.py`: create initial tenant, admin user, and portal configurations via backend API/management commands.
- `sync-config.sh`: pull latest shared configs from `configs/` into service directories.

Document interpreter requirements and environment variables for each script.
