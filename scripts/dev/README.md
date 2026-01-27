# Local Development Scripts

Docker-first workflows intended for local development. These scripts should not
be invoked by CI.

## Available Scripts

- `backend-checks.sh`: run backend checks inside the Docker container.
- `frontend-checks.sh`: run frontend lint/format/test inside the Docker container.

These scripts resolve the repo root automatically and can be run from any
working directory.
