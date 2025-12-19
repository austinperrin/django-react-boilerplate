# Backend Coding Standards (Django/DRF)

## Project Structure

- Django project config lives under `services/backend/config/` with environment-specific settings modules (`base`, `dev`, `prod`).
- Domain logic resides in `services/backend/apps/<domain>/` with clear boundaries; share code via `apps/common` or `packages/`.
- Each domain exposes REST endpoints under `apps/<domain>/api/v1/`; routers are registered in `config/urls.py` using versioned prefixes.

## Style & Linting

- Format with Black (line length 88) and lint with Ruff; enforce via CI once tooling lands.
- Type hints are mandatory for public functions/classes; run mypy in strict mode for `apps/` packages.
- Follow PEP8 naming conventions; favor explicit imports over wildcard.
- Avoid business logic in views/serializers—delegate to `services.py`/domain services when workflows become complex.

## Security Practices

- Use DRF permissions and custom permission classes for RBAC enforcement; never rely solely on client-provided claims.
- Validate all serializer inputs; never pass untrusted data directly to ORM filters without sanitization.
- Disable Django admin; build custom management endpoints protected by RBAC.
- Log authentication events, permission denials, and admin actions with tenant context.

## Testing

- Use pytest with pytest-django. Organize tests alongside apps (`apps/<domain>/tests/`).
- Include API tests covering success and failure cases for every endpoint; mock external services when needed.
- Minimum coverage target: 80% per domain app before GA; track via coverage reports in CI.

## Patterns to Follow

- Use DRF viewsets + routers when possible for consistency; fallback to APIViews only for non-REST flows.
- Model managers should encapsulate reusable queries (especially tenant scoping).
- Keep migrations atomic and idempotent; include data migrations for default RBAC roles/permissions.

## Logging & Observability

- Standardize logging via Python `logging` configured in `config/settings`. Include tenant ID, user ID, and correlation IDs.
- Emit audit events for security-sensitive operations to a dedicated channel (future integration with SIEM).

Refer to this doc before adding new backend modules and update it when patterns evolve.
