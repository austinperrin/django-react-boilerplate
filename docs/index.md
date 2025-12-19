# Documentation Index

Authoritative starting point for all project documentation. Each section below links to folders that should contain detailed guides. Keep this file up to date whenever new docs are added.

## Structure

- `overview/` – product vision, tenant model, personas, release themes.
- `architecture/` – diagrams, sequence flows, environment topology, integration contracts.
- `runbooks/` – operational procedures (deployments, incident response, backup/restore).
- `security/` – threat modeling, control matrix, compliance checkpoints, secrets guidance.
- `standards/` – coding conventions, branching strategy, testing expectations, style guides.
- `adr/` – Architectural Decision Records. Use incrementing numeric prefixes (e.g., `0001-repo-structure.md`).

## Conventions

1. Prefer Markdown. Keep filenames kebab-case and meaningful.
2. Add table of contents sections to longer docs for quick scanning.
3. Cross-link ADR IDs or guide filenames when referencing other docs.
4. Record ownership (point of contact) at the top of each document when applicable.

## Next Steps

- Reference ADR-0001 for repo/documentation layout; draft follow-up ADRs (auth strategy, CI/CD, portal architecture).
- Add initial standards for branching, security, and testing as they are defined.
- Populate runbooks once CI/CD and operational flows are implemented.
