# Security Baseline

## Guiding Principles

1. **Least Privilege**: every component, user, and integration receives only the permissions required for its task.
2. **Defense in Depth**: combine network controls, application checks, and monitoring to catch failures.
3. **Secure by Default**: new tenants inherit hardened settings (password policies, MFA requirements, logging). Opt-in is required to loosen restrictions.

## Controls

- **Authentication**: JWT issuance backed by Django auth + optional external IdPs. MFA enforced for privileged roles.
- **Authorization**: Role-based access control enforced server-side on every request; permissions defined centrally and consumed across services.
- **Transport Security**: HTTPS everywhere, HSTS on external endpoints, TLS 1.2+.
- **Secrets Management**: Environment variables loaded from encrypted secret stores; rotation documented in runbooks.
- **Data Protection**: At-rest encryption for Postgres, backups, and any object storage. Sensitive fields encrypted at the application layer when required.
- **Logging & Monitoring**: Structured logs with tenant/user context; audit trails for authentication events, admin actions, and data exports.
- **Dependency Hygiene**: Automated scanning (pip-audit, npm audit, Trivy) with remediation SLAs.

## Compliance Considerations

- Document mappings to frameworks such as SOC 2, FERPA, or HIPAA as tenants require.
- Store evidence (policies, logs) in a centralized compliance repository (future work).

Keep this baseline updated as new controls are implemented or compliance requirements emerge.
