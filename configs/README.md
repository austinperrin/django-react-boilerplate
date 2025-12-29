# Configuration Templates

Central repository for environment-agnostic configuration artifacts (env file samples, policy files). Keeps sensitive values out of source while documenting expected settings.

## Layout

- `env/`
  - `.env.backend.example` – Django/DRF service variables (copy to `.env.backend`).
  - `.env.frontend.example` – Vite frontend settings (copy to `.env.frontend`).
- `policy/`
  - `security-checklist.md` – pre-release/tenant onboarding checklist.

## Usage

1. Copy the `.env.backend.example` and `.env.frontend.example` templates to the repo root as `.env.backend` and `.env.frontend`, then fill tenant-specific values.
2. Update policy templates as compliance requirements evolve.

## Conventions

- Never commit secrets—only sample values and documentation.
- Keep these templates in sync with service READMEs and runbooks.
- Document configuration changes via ADRs when they impact deployments.
