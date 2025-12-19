# System Overview

## Components

- **Backend (`services/backend`)**: Django/DRF API exposing versioned endpoints (`/api/v1/<domain>/`). Handles identity, RBAC, tenant config, and business domains.
- **Frontend (`services/frontend`)**: React/Vite app hosting tenant-defined portals and consuming the backend API via JWT-authenticated calls.
- **Shared Packages (`packages/`)**: Auth helpers, RBAC definitions, UI kits, config loaders.
- **Infrastructure (`infra/`)**: Docker Compose configs for dev/test, Terraform modules for provisioning per-tenant environments.

## Data Flow

1. User hits portal URL → frontend loads portal metadata and renders appropriate module.
2. User authenticates (username/password, SSO, etc.) → backend issues JWT with tenant + portal context.
3. Frontend stores token securely (HTTP-only cookie) and uses it for API requests.
4. Backend enforces RBAC per endpoint; responses include tenant-scoped data pulled from the tenant’s Postgres DB.

## Environment Separation

- **Dev**: local Docker Compose orchestrating backend/frontend; developers connect to local or remote Postgres/Redis.
- **Test**: CI environments running ephemeral services, pointing to dedicated testing databases.
- **Prod**: per-tenant deployments, each with its own remote Postgres instance and secrets.

## Observability

- Logging: centralized structured logs per service, including tenant/user IDs.
- Metrics: to be defined (Prometheus/OpenTelemetry). Will differentiate per tenant.
- Tracing: plan to instrument API and frontend interactions for debugging complex flows.

Expand this document with diagrams and integration details as services are implemented.
