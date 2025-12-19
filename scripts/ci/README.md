# CI Scripts

Scripts invoked by GitHub Actions (or other CI) to run linting, tests, and packaging steps.

## Guidelines

- Keep scripts idempotent and deterministic; CI environments are ephemeral.
- Accept configuration via env vars (e.g., `SERVICE=backend`, `NODE_ENV=test`).
- Exit non-zero on failure so workflows fail fast.

Potential scripts:

- `run-backend-tests.sh`: install deps, run pytest + coverage.
- `run-frontend-tests.sh`: npm install, lint, test.
- `scan-security.sh`: aggregate Bandit/pip-audit/npm audit results.

Update this directory as pipelines mature.
