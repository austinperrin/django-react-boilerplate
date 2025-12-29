# ADR 0003: Workspace and Package Manager Strategy

- **Status**: Accepted
- **Date**: 2025-12-28
- **Owners**: Austin Perrin, contributors

## Context

The repo is a mono-repo with backend services, a frontend app, and shared
packages. We need a strategy that scales professionally as the project grows,
without over-optimizing before the first services are fully scaffolded.

## Decision

1. **JavaScript/TypeScript**: Use npm as the default package manager and enable
   npm workspaces when `packages/` and `services/frontend/` are scaffolded.
2. **Python**: Continue with `requirements/*.txt` managed by pip for the backend.
3. **Monorepo tooling**: Defer dedicated build orchestrators (Turbo/Nx/Bazel)
   until multiple packages and cross-service build pipelines require them.

## Consequences

- Tooling stays familiar and enterprise-friendly, reducing onboarding friction.
- Workspaces can be introduced incrementally without forcing a tooling migration.
- Python dependencies remain simple and explicit until advanced needs arise.

## Alternatives Considered

- pnpm workspaces (faster installs, but additional tooling adoption).
- Poetry or uv for Python (more advanced workflows, but larger migration surface).
- Turbo/Nx immediately (premature complexity until multiple packages exist).

## Follow-Up

- Add `package.json` with workspace settings once the frontend scaffold lands.
- Revisit this ADR when shared packages become active dependencies.
