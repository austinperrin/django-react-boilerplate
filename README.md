# django-react-boilerplate

Enterprise-oriented mono-repo boilerplate for single-tenant SaaS deployments built with Django/DRF and React/Vite. The repo is currently in scaffolding mode; use `docs/index.md` for the canonical documentation tree and decisions.

## Getting Started

- Review `docs/index.md` for structure, conventions, and ADRs.
- Run `scripts/bootstrap/dev.sh` to create `.env` files and generate `DJANGO_SECRET_KEY` when it is missing or still the placeholder (use `--rotate-secret` to force rotation).
- If you prefer manual setup, copy `configs/env/.env.backend.example` to `.env.backend` and `configs/env/.env.frontend.example` to `.env.frontend`.
- Run `docker compose -f infra/docker/docker-compose.dev.yml up --build` for local development.
- Include the frontend profile when needed: `docker compose -f infra/docker/docker-compose.dev.yml --profile frontend up --build`.
- Run `npm install` at repo root when using the frontend workspace tooling.
- Use `scripts/dev/backend-checks.sh` and `scripts/dev/frontend-checks.sh` for local checks.
- Use `scripts/` for repeatable automation hooks as they are added.

## Status

This project is under initial setup. Expect documentation and code to evolve rapidly as conventions solidify.
