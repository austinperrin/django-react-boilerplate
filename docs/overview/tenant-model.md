# Tenant Model

## Deployment Model

- Each tenant represents an organization (school district, company, vendor) and receives a dedicated deployment of the mono-repo services.
- Deployments are identical except for configuration (enabled portals, identity providers, feature toggles).
- Each tenant has a dedicated remote Postgres database plus isolated secrets.

## Configuration Layers

1. **Global Defaults**: stored in `configs/` templates (e.g., password policies, session lengths).
2. **Tenant Overrides**: persisted in the backend (e.g., tenant profile) and loaded at runtime to tailor portals and auth flows.
3. **Per-Portal Settings**: dictate landing page URLs, allowed auth methods, feature availability.

## User Types

- Tenants define custom user types (e.g., parent, student, faculty, vendor). Each user type maps to RBAC roles and portal experiences.
- Default roles include `tenant-admin`, `support`, `standard-user`. Additional roles documented in RBAC matrix (forthcoming).

## Lifecycle

1. **Provisioning**: create infrastructure via IaC, seed tenant record, configure identity providers.
2. **Operation**: monitor tenant-specific metrics/logs; apply updates via automated pipelines.
3. **Decommissioning**: archive data, revoke secrets, tear down infrastructure following compliance requirements.

Keep this document updated as tenant onboarding/offboarding workflows evolve.
