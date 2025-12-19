# ADR 0001: Repository Structure & Documentation Strategy

- **Status**: Accepted
- **Date**: 2025-12-28
- **Owners**: Austin Perrin, contributors

## Context

We are building a security-first, single-tenant SaaS boilerplate combining Django/DRF and React/Vite. The codebase must support multiple deployable services (backend, frontend, future portals/services), shared libraries, and robust infrastructure artifacts. Documentation should live alongside code with clear discoverability.

## Decision

Adopt the following top-level mono-repo layout:

```
├── services/
│   ├── backend/      # Django/DRF API with domain apps
│   └── frontend/     # React/Vite client with tenant-defined portals
├── packages/         # shared libraries (auth, RBAC, config, UI)
├── infra/            # Docker, compose files, IaC scaffolding
├── configs/          # environment templates, lint configs, policies
├── scripts/          # automation helpers (bootstrap, CI, utilities)
├── docs/             # documentation hub with subfolders + ADRs
├── AGENTS.md         # automation manifest
└── README.md         # high-level overview pointing to docs/index.md
```

Documentation conventions:

- `docs/index.md` is the canonical entry point linking to `overview/`, `architecture/`, `runbooks/`, `security/`, `standards/`, and `adr/`.
- Architecture diagrams (including infra topology) live under `docs/architecture/`, with infra-specific assets in `docs/architecture/infra/`.
- ADRs follow `docs/adr/NNNN-title.md` naming.

Infrastructure conventions:

- Docker-first for services; Postgres remains an external dependency in every environment.
- Use Docker Compose for dev/test; production deployments mirror the same topology per tenant with remote Postgres instances.
- IaC tooling (e.g., Terraform) will live under `infra/terraform/` once defined.

Backend conventions:

- Domain apps reside under `services/backend/apps/` (e.g., `common`, `identity`).
- API endpoints versioned as `/api/v1/<domain>/...` with strict RBAC enforcement and no Django admin UI.

Frontend conventions:

- Source under `services/frontend/src/` with `apps/<portal>` representing tenant-defined portal entry points.
- RBAC-aware routing and shared UI kits originate from `packages/`.

Shared tooling:

- Reusable libraries live in `packages/` with clear documentation.
- Automation scripts live under `scripts/` and should be portable/idempotent.
- Configuration templates stored in `configs/` to keep sensitive data out of the repo.

## Consequences

- Contributors have a predictable home for new services, packages, and documentation.
- Centralized docs reduce drift between code and guidance.
- Docker/Compose remains the primary orchestration mechanism, easing onboarding while keeping room for future IaC.
- External Postgres requirement simplifies production parity but requires contributors to provision their own dev instances.

## Follow-Up

1. Reference this ADR when adding new folders or documentation sections to keep structure consistent.
2. Scaffold additional ADRs for authentication strategy, CI/CD tooling, and portal architecture.
3. Populate docs subfolders (overview, standards, security, runbooks) as decisions solidify.
