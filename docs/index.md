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

- Reference ADR-0001 for repo/documentation layout; draft follow-up ADRs (CI/CD, entry point architecture) as the roadmap advances.
- Review the internal roadmap and tenant topology docs as decisions evolve.
- Keep standards documents aligned as tooling and implementation land.
- Expand runbooks once CI/CD and operational flows are implemented.
