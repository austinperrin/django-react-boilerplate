# Contributing Guide

Thanks for helping build this mono-repo. This guide summarizes expectations and references the detailed standards documented under `docs/`.

## Getting Started

1. Clone the repo and review `README.md` plus `docs/index.md`.
2. Copy `.env.backend` / `.env.frontend` from `configs/env/` templates or run `scripts/bootstrap/dev.sh`.
3. Use `infra/docker/docker-compose.dev.yml` to run backend/frontend containers once code exists.

## Workflow

- Follow the git workflow in `docs/standards/git-workflow.md` (feature branches, protected `main`, semantic tags).
- Every change goes through a pull request referencing relevant ADRs/issues.
- Keep PR descriptions clear (summary, testing evidence, roll-out notes).

## Coding & Testing

- Backend style: `docs/standards/backend-style.md`.
- Frontend style: `docs/standards/frontend-style.md`.
- Testing policy: `docs/standards/testing-policy.md` (pytest, Vitest, coverage targets, security scans).

## Documentation

- Update docs/runbooks when behavior changes; new decisions require ADRs under `docs/adr/`.
- Keep `configs/` templates synchronized with service requirements.

## Code Reviews

- Adhere to commit/documentation standards (`docs/standards/commit-and-docs.md`).
- Mention security implications, migrations, or operational impact in PR descriptions.
- At least one approval is required; if working solo, complete the self-review checklist before merging.

For major changes, open an issue or ADR proposal first to discuss the approach.
