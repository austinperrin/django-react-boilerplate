# Infrastructure Standards

Repository conventions for containerization and environment configuration.

## Docker Conventions

- Service Dockerfiles live alongside service code (for example, `services/backend/Dockerfile`).
- Each service maintains its own `.dockerignore` next to the Dockerfile so the build context is scoped to that service.
- Compose files live under `infra/docker/`; development orchestration uses `infra/docker/docker-compose.dev.yml`.
- Compose files follow the Compose Specification and omit the top-level `version` field.

## Environment Files

- Root-level `.env.backend` and `.env.frontend` are the sources of truth for local development.
- Copy templates from `configs/env/` and never commit real secrets.
- Keep templates in sync with any new runtime variables introduced by services.

## Operational Guidance

- Treat Dockerfiles as the canonical build instructions; avoid ad hoc steps outside Compose.
- Add production-ready stages only when requirements are clear (process manager, static assets, non-root user).
