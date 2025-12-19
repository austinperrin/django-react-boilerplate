# Deployment Runbook

## Scope

Covers tenant-specific deployments across dev, test, and prod environments using Docker Compose and future IaC automation.

## Prerequisites

- Access to source repo and CI/CD pipelines.
- Credentials to target environment (SSH, cloud API keys, secrets manager).
- Verified `.env` files/config templates populated for the tenant.

## Steps

1. **Prepare Artifacts**
   - Ensure `main` (or release branch) has passed CI.
   - Build backend/frontend containers via `docker compose build` or CI pipeline.
2. **Apply Infrastructure (if new tenant)**
   - Run Terraform (once available) to provision network, Postgres, secrets.
   - Record outputs in tenant registry.
3. **Configure Secrets**
   - Populate secret manager with env vars (DB URL, JWT secrets, SSO credentials).
4. **Deploy Services**
   - Use Docker Compose or orchestrator to bring up backend/frontend containers.
   - Run database migrations: `python manage.py migrate` scoped to tenant DB.
5. **Verify**
   - Hit health endpoints (`/api/v1/common/health/`).
   - Run smoke tests (login via each portal, basic CRUD flows).
6. **Notify**
   - Update release notes and inform stakeholders.

## Rollback

- Keep previous container images tagged for quick rollback.
- Maintain database backups snapshots before migrations; restore if necessary following backup runbook.

## Automation Hooks

- CI/CD workflows (to be implemented) should orchestrate most steps. Manual execution available via `scripts/`.

Update this runbook as deployment tooling matures.
