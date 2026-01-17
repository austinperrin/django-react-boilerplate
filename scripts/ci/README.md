# CI Scripts

Scripts invoked by GitHub Actions (or other CI) to run linting, tests, and packaging steps.

## Guidelines

- Keep scripts idempotent and deterministic; CI environments are ephemeral.
- Accept configuration via env vars (e.g., `SERVICE=backend`, `NODE_ENV=test`).
- Exit non-zero on failure so workflows fail fast.

Potential scripts:

- `run-backend-lint.sh`: run Ruff + Black checks for the backend.
- `run-backend-checks.sh`: run backend checks (Django check/test + mypy).
- `run-backend-typecheck.sh`: run mypy checks for the backend.
- `run-backend-tests.sh`: install deps, run pytest + coverage.
- `run-frontend-lint.sh`: run ESLint + Prettier checks for the frontend workspace.
- `run-frontend-checks.sh`: run frontend lint/format/test via Docker Compose.
- `run-frontend-tests.sh`: run frontend unit tests for the workspace.
- `scan-security.sh`: aggregate Bandit/pip-audit/npm audit results.

Update this directory as pipelines mature.
