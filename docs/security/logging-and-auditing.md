# Logging & Auditing

## Logging Standards

- Use structured logging (JSON) with fields: timestamp, service, tenant_id, user_id, entry_point_slug, request_id.
- Log levels:
  - `INFO` for normal operations.
  - `WARNING` for recoverable issues.
  - `ERROR` for failed operations (with stack traces).
  - `SECURITY` (custom) for auth/permission events.
- Mask sensitive data (passwords, tokens, PII) before logging.

## Audit Events

Log the following at minimum:

- Authentication attempts (success/failure, MFA challenges).
- Role/permission changes.
- Tenant configuration edits (entry points, IAM settings, feature flags).
- Data exports/imports.
- Administrative actions (user suspension, data deletion).

## Retention & Access

- Retain logs for at least 90 days (configurable per tenant compliance needs).
- Store logs in centralized system (ELK, CloudWatch, Splunk) with per-tenant filtering.
- Control access via RBAC; only authorized personnel may view tenant-specific logs.

## Monitoring & Alerting

- Configure alerts for successive auth failures, privilege escalations, or anomaly detection (e.g., logins from unusual locations).
- Integrate with incident response runbook for escalation procedures.

Update this document with specific tooling (log shippers, indexes, dashboards) once selected.
