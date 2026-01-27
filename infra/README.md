# Infrastructure

Central location for environment configuration, container orchestration, and future IaC. Aligns with the mono-repo goal of shipping backend/frontend/services via Docker.

## Layout

```
infra/
├── docker/        # docker-compose files, service overrides, helper scripts
├── terraform/     # IaC modules (once defined) for hosting environments
└── README.md
```

## Environment Strategy

- **Development**: `docker-compose.dev.yml` orchestrates backend, frontend, and runtime dependencies (e.g., Redis). Postgres is external—use a dedicated dev database instance. When running Docker on macOS/Windows against a host DB, use `host.docker.internal` in `DATABASE_URL`. Linux development is not a target path; assume Linux hosts use remote databases in production contexts.
- **Testing**: optional `docker-compose.test.yml` or CI workflow containers for integration/e2e suites. Tests should target an external Postgres instance seeded via fixtures/migrations.
- **Production**: compose file per tenant deployment plus IaC modules that provision infrastructure (networking, databases, secrets). Keep provider-agnostic patterns with hooks for cloud-specific modules. Each tenant gets its own remote Postgres instance (distinct from dev).

## Principles

1. Docker-first. Every service must have a container definition with sensible defaults.
2. Twelve-Factor alignment: config via env vars/secret stores, stateless services, externalized backing services.
3. Security as code: baked-in network policies, TLS termination guidance, image scanning.
4. Documentation alongside code: store infrastructure diagrams and threat models under `docs/architecture/infra/` and link to them here.

## Usage

- Run `scripts/bootstrap/dev.sh` to create `.env` files, then update values.
- If you prefer manual setup, copy `.env.backend` / `.env.frontend` from templates in `configs/env/`.
- From the repo root, run `docker compose -f infra/docker/docker-compose.dev.yml up --build`.
- Include the frontend profile when running the Vite dev server: `docker compose -f infra/docker/docker-compose.dev.yml --profile frontend up --build`.
- Run `npm install` at repo root when using the frontend workspace tooling.
- Backend/frontend Dockerfiles live under `services/backend/` and `services/frontend/`; update them as code is added.

## Next Steps

- Add test/production compose snippets or overlays as services mature.
- Decide on IaC tooling (Terraform modules per environment vs vendor-specific). Capture via ADR.
- Define secret management approach (e.g., Vault, AWS Secrets Manager) and document bootstrap steps.
