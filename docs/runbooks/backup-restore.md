# Backup & Restore Runbook

## Backup Strategy

- **Databases**: Nightly snapshots of each tenant Postgres instance via managed service. Retain for 30 days (configurable per tenant SLA).
- **File Storage**: If/when object storage is added, enable versioning and lifecycle policies.
- **Configs/Secrets**: Version-controlled in secret manager with audit logs.

## Monitoring

- Automated checks verify backup completion; alerts fire on failure or data size anomalies.
- Periodic restore tests (monthly per tenant, quarterly full-scale) ensure backups are usable.

## Restore Procedure

1. Confirm incident scope and determine restore point (timestamp, snapshot ID).
2. Notify tenant stakeholders and pause application writes.
3. Provision new Postgres instance or restore snapshot in place (per RTO/RPO).
4. Run integrity checks/migrations if needed.
5. Point backend service to restored database (update secrets/env vars).
6. Validate application functionality with smoke tests.
7. Resume traffic and monitor closely.

## Documentation

- Log each backup/restore event with timestamps, operators, and verification results.
- Update tenant records with restore history for compliance.

Add automation scripts under `scripts/runbooks/` as the backup tooling is implemented.
