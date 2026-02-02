# Utility Scripts

Ad-hoc tooling that doesn’t fit bootstrap or CI categories (e.g., scaffolding generators, reporting helpers).

Examples:

- `create-portal.py`: scaffold frontend/backend artifacts for a new portal slug.
- `cleanup-docker.sh`: remove stale containers/images during development.
- `health-check.sh`: hit service health endpoints for smoke testing.
- `generate-django-secret.py`: print a random Django `SECRET_KEY` value.

Document usage and dependencies inside each script. Consider promoting frequently used utilities to `packages/` if they become shared libraries.
