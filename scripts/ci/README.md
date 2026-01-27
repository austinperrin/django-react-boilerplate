# CI Scripts

Scripts invoked by GitHub Actions (or other CI) to run linting, tests, and packaging steps.

## Guidelines

- Keep scripts idempotent and deterministic; CI environments are ephemeral.
- Accept configuration via env vars (e.g., `SERVICE=backend`, `NODE_ENV=test`).
- Exit non-zero on failure so workflows fail fast.

Scripts:

- `backend-lint.sh`: run Ruff + Black checks for the backend (host-based).
- `backend-tests.sh`: run pytest for the backend (host-based).
- `backend-typecheck.sh`: run mypy checks for the backend (host-based).
- `frontend-lint.sh`: run ESLint + Prettier checks for the frontend workspace (host-based).
- `frontend-tests.sh`: run frontend unit tests for the workspace (host-based).
- `scan-security.sh`: aggregate Bandit/pip-audit/npm audit results.

Backend scripts are expected to run with `services/backend` as the working
directory (set by CI). Local Docker-first checks live under `scripts/dev/`.
