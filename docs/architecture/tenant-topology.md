# Tenant Topology

Defines how a single tenant is deployed as a collection of services. Each tenant
receives its own isolated stack, data stores, and runtime configuration.

## Topology Summary

Per tenant:
- One or more frontend services (portal UI, static assets, CDN edge).
- One backend API service (Django/DRF) as the initial default.
- One or more worker services (async jobs, scheduled tasks).
- One tenant-isolated managed Postgres instance.
- Optional cache/queue services (Redis, etc.).

## Service Responsibilities

- Frontend: portal routing, RBAC-aware UI, calls backend APIs.
- Backend: identity, auth, RBAC enforcement, domain logic.
- Workers: long-running jobs (emails, reports, sync tasks).

## Isolation Guarantees

- Dedicated database per tenant.
- Dedicated secrets and configuration per tenant.
- No cross-tenant network paths except shared tooling (CI, artifact registry).

## Networking

- TLS termination at the load balancer/reverse proxy.
- Backend service only reachable from frontend and internal worker networks.
- Database restricted to backend/worker service IPs.

## Scaling Notes

- Frontend can be horizontally scaled per portal traffic.
- Backend scales per tenant workload; workers scale by queue depth.
- Use per-tenant limits for CPU/memory to prevent noisy neighbors.

## Open Questions

- Cache/queue selection and whether it is per-tenant or shared.
- Secrets manager and key rotation process.
- Whether to split backend into separate services over time.

## Hosting Model

- Hosting is environment-agnostic: cloud, on-prem, or hybrid.
- Default guidance should assume managed infrastructure (e.g., managed Postgres),
  with self-managed equivalents available for on-prem deployments.

## Product Scope Notes

- Mobile clients are a planned future addition and are not part of the MVP.
- The backend starts as a single API service with separate worker services; it can
  be decomposed into multiple services later if scale or domain boundaries require it.
