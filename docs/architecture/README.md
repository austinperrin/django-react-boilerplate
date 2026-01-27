# Architecture Documentation

System diagrams, data flows, deployment topology, and integration contracts.

## Available Documents

- `system-overview.md` – textual overview of services, data flow, observability.
- `login-portal-routing.md` – login portal routing and entry point configuration flow.
- `post-login-routing.md` – post-login routing and RBAC gating conventions.
- `infra/topology.md` – baseline infrastructure diagram and environment separation.
- `tenant-topology.md` – per-tenant multi-service deployment layout.

## Additional Sections to Populate

- Sequence diagrams for auth flows, login portal routing, background jobs.
- Data storage model: per-tenant Postgres, caching layers, search/indexing (future).
- Integration surface: external IdPs, email/SMS providers, third-party APIs.

Store diagrams (PlantUML, draw.io exports, etc.) within this directory and reference them from ADRs.
