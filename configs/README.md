# Configuration Templates

Central repository for environment-agnostic configuration artifacts (env file samples, lint/format configs, policy files). Keeps sensitive values out of source while documenting expected settings.

## Layout

- `env/`
  - `.env.backend.example` – Django/DRF service variables (copy to `.env.backend`).
  - `.env.frontend.example` – Vite frontend settings (copy to `.env.frontend`).
- `lint/`
  - `.eslintrc.json`, `.prettierrc.json` – shared JS lint/format configs.
  - `pyproject.toml` – Black/Ruff/mypy defaults for Python services.
- `policy/`
  - `security-checklist.md` – pre-release/tenant onboarding checklist.

## Usage

1. Copy the relevant `.env.example` files into service directories and fill tenant-specific values.
2. Reference lint configs from service/package tooling (e.g., symlink or extend).
3. Update policy templates as compliance requirements evolve.

## Conventions

- Never commit secrets—only sample values and documentation.
- Keep these templates in sync with service READMEs and runbooks.
- Document configuration changes via ADRs when they impact deployments.
