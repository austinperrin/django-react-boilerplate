# Incident Response Runbook

## Severity Levels

- **SEV1**: Production outage or data breach affecting multiple tenants.
- **SEV2**: Tenant-specific outage or degraded performance.
- **SEV3**: Minor bug with workaround, no SLA breach.

## Immediate Actions

1. Acknowledge alert (PagerDuty/monitoring) and assign incident commander.
2. Create shared communication channel (chat + incident doc).
3. Record timeline: when detected, who is involved, affected tenants.

## Investigation

- Collect logs/metrics from backend/frontend/infra.
- Validate tenant scope; identify recent deployments/changes.
- Engage relevant SMEs (backend, frontend, infra, security).

## Mitigation

- Apply safe mitigations first (rollback, feature flag disable, scaling adjustments).
- Communicate status updates to stakeholders every 30 minutes (or per tenant SLA).
- If security incident, follow containment procedures (rotate secrets, block access).

## Resolution & Postmortem

- Declare incident resolved once services operate normally and monitoring is green.
- Schedule postmortem within 5 business days; document root cause, contributing factors, and action items.
- Update runbooks, ADRs, or tooling based on findings.

## Contacts & Escalation

- Incident Commander: on-call engineer (see ops schedule).
- Security Contact: security lead (TBD).
- Tenant Communications: account manager or designated contact per tenant.

Fill in placeholders (tools, contacts) once operations processes are formalized.
