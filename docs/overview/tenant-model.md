# Tenant Model

## Deployment Model

- Each tenant represents an organization (school district, company, vendor) and receives a dedicated deployment of the mono-repo services.
- Deployments are identical except for configuration (enabled entry points, identity providers, feature toggles).
- Each tenant has a dedicated remote Postgres database plus isolated secrets.

## Configuration Layers

1. **Global Defaults**: stored in `configs/` templates (e.g., password policies, session lengths).
2. **Tenant Overrides**: persisted in the backend (e.g., tenant profile) and loaded at runtime to tailor entry points and auth flows.
3. **Per-Entry-Point Settings**: dictate landing page URLs, allowed auth methods, feature availability.

## User Types

- Tenants define custom user types (e.g., parent, student, faculty, vendor). Each user type maps to RBAC roles and login portal experiences.
- Default roles include `tenant-admin`, `support`, `standard-user`. Additional roles live in the RBAC matrix and will evolve as IAM/RBAC scope expands.

## Lifecycle

1. **Provisioning**: create infrastructure via IaC, seed tenant record, configure identity providers.
2. **Operation**: monitor tenant-specific metrics/logs; apply updates via automated pipelines.
3. **Decommissioning**: archive data, revoke secrets, tear down infrastructure following compliance requirements.

Keep this document updated as tenant onboarding/offboarding workflows evolve.
