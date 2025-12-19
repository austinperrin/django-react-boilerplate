# Utility Scripts

Ad-hoc tooling that doesn’t fit bootstrap or CI categories (e.g., scaffolding generators, reporting helpers).

Examples:

- `create-portal.py`: scaffold frontend/backend artifacts for a new portal slug.
- `cleanup-docker.sh`: remove stale containers/images during development.
- `health-check.py`: hit service health endpoints for smoke testing.

Document usage and dependencies inside each script. Consider promoting frequently used utilities to `packages/` if they become shared libraries.
