# Shared Packages

Reusable libraries consumed by services (backend, frontend, workers). Keeps deployment-specific code inside `services/` while providing a common source of truth for cross-cutting concerns.

## Examples

- `packages/auth/`: shared auth helpers (JWT schemas, claim validators, tenancy config loaders).
- `packages/rbac/`: role/permission definitions consumed by both backend and frontend.
- `packages/ui/`: design system components, tokens, icons (could power Storybook).
- `packages/config/`: typed configuration schema + env loader shared across services.
- `packages/types/`: TypeScript definitions or OpenAPI-generated clients.

## Conventions

1. Each package gets its own folder with a README explaining purpose and consumers.
2. Versioning managed via workspace tooling (e.g., npm workspaces, poetry). Align with repo-wide tooling decisions.
3. Keep packages framework-agnostic when possible; prefer pure Python/JS modules that multiple services can consume.
4. Enforce linting/testing per language inside each package (e.g., `pytest` for Python libs, `vitest` for TS libs).
5. Document dependencies between packages/services to avoid hidden coupling.

## Next Steps

- Decide on package manager strategy (npm/pnpm for JS packages, Poetry for Python?) and capture via ADR.
- Identify first shared modules (likely `auth`, `rbac`, `config`) and scaffold them with placeholders.
- Integrate tooling (e.g., TurboRepo, makefiles) to build/test packages consistently.
