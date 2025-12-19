# Secrets Management

## Principles

- Secrets must never be stored in source control; use environment variables sourced from encrypted stores.
- Rotate credentials regularly (quarterly minimum) or immediately following an incident.
- Grant least privilege access to secret stores; only services/components that need a secret may read it.

## Storage Options

- **Local Development**: `.env.backend` / `.env.frontend` files stored outside version control; developers may use local secret managers (1Password, Doppler) to inject values.
- **Production**: managed secret stores (AWS Secrets Manager, Azure Key Vault, HashiCorp Vault). Reference secrets via environment variables in Docker/Kubernetes manifests.

## Distribution

- CI/CD pipelines fetch secrets at deploy time; no secrets baked into images.
- Scripts under `scripts/bootstrap/` should pull from the secret manager when bootstrapping new tenants.

## Rotation Procedure

1. Generate new secret (DB password, JWT key, API token).
2. Update secret manager entry and mark old value for decommission.
3. Redeploy services consuming the secret.
4. Verify functionality; remove old secret after successful validation.
5. Document rotation in runbooks/logs.

## Auditing

- Enable access logs on secret stores; review for anomalies monthly.
- Track who initiated rotations and when via runbook entries or ticket references.

Document provider-specific instructions (CLI commands, Terraform modules) once selected.
