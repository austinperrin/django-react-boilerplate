# Infrastructure Topology

## Baseline Deployment

```
Tenant VPC/Network
├─ Load Balancer / Reverse Proxy
│  ├─ Frontend service (Vite build served via CDN or container)
│  └─ Backend API (Django/DRF container)
├─ Redis / Cache layer (optional)
└─ Managed Postgres instance (per tenant)
```

- Secrets injected via environment variables sourced from a secret manager (e.g., AWS Secrets Manager, Vault).
- All traffic terminates TLS at the load balancer with certificates managed centrally.
- Backend and frontend containers run on the same host cluster (Docker Compose initially, future Kubernetes/VM clusters).

## Environments

- **Development**: Docker Compose on developer machines; Postgres/Redis run locally or via remote managed services.
- **Testing**: CI spins up containers for backend/frontend; uses dedicated Postgres schema or database per pipeline run.
- **Production**: Each tenant gets isolated infrastructure (network, compute, database). IaC automates provisioning.

## Network & Security

- Restrict database access to backend service IPs; no direct public exposure.
- Enforce security groups/firewall rules per environment.
- Collect logs centrally (e.g., CloudWatch/ELK) with tenant tags for auditability.

Document provider-specific details (AWS/Azure/on-prem) as soon as infrastructure decisions are finalized. Add diagrams (PlantUML/draw.io) to this folder and link them here.
