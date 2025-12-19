# Backend Service

Django + Django REST Framework API that powers the mono-repo. This document captures structural conventions before code is added.

## Goals

- Single-tenant deployments with per-tenant Postgres database.
- Modular domain apps living under `services/backend/apps/`.
- Consistent API versioning (`/api/v1/<domain>/...`).
- Security-first defaults (JWT auth, RBAC, no Django admin UI).

## Layout

```
services/backend/
├── apps/
│   ├── common/          # cross-cutting utilities (RBAC base classes, audit helpers)
│   ├── identity/        # tenant identity/IAM domain (users, profiles, SSO connectors)
│   └── ...
├── config/             # Django project settings module (env aware)
├── manage.py
└── docker/             # service-specific Docker assets if needed
```

- `apps/<domain>`: each domain is a Django app with its own `api/v1/<domain>/` namespace (routers, serializers, views).
- `config/`: split settings for `base.py`, `dev.py`, `test.py`, `prod.py`, referencing shared env vars loaded via `configs/`.
- `docker/`: overrides or extra compose snippets specific to the backend service.

## API Conventions

- REST endpoints under `/api/v1/<domain>/` by default; bump versions via ADR when breaking changes occur.
- JWT-based auth with pluggable identity providers per tenant (default Django auth + optional SSO integrations).
- RBAC enforced in DRF permissions; admin-only features exposed via same endpoints but gated by permissions.

## Security Expectations

- Remove Django admin site; replace with purpose-built management views in domain apps.
- Require HTTPS and secure cookies in prod; CSRF protection for session-based flows.
- Enforce OWASP best practices: rate limiting, input validation, secure headers, audit logging.
- Secrets loaded from environment or secret manager; never hard-coded.

## Next Steps

- Draft ADR for authentication/identity strategy.
- Scaffold initial domain apps (`common`, `identity`) focusing on tenant-aware models.
- Integrate testing/linting workflow (pytest, mypy, bandit) aligned with CI/CD.
