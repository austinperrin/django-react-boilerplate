# AGENTS.md

## Dev environment tips
- Repo uses root-level `.env.backend` and `.env.frontend`; copy from `configs/env/` templates and keep secrets out of git.
- Backend settings are split by environment under `services/backend/config/settings/` with `config.settings.dev` as the default module.
- For Docker dev, use `docker compose -f infra/docker/docker-compose.dev.yml up --build`.
- If running Django in Docker, bind the server to `0.0.0.0:8000`.
- Use `rg` for fast repo searches (preferred over `grep`).

## Testing instructions
- Backend quick checks: `python manage.py check` and `python manage.py test` from `services/backend/`.
- Docker dev smoke check: `docker compose -f infra/docker/docker-compose.dev.yml up --build` and confirm the backend boots.
- Python linting/tooling config lives in `configs/lint/pyproject.toml` (ruff/black/mypy).

## PR instructions
- Commit messages follow Conventional Commits (`feat:`, `fix:`, `docs:`, `refactor:`).
- Subject line ≤72 characters; add a body when the change isn’t obvious.
- Keep `.env` files and secrets out of commits; update templates in `configs/env/` instead.
