# Frontend Coding Standards (React/Vite)

## Project Structure

- Source code lives in `services/frontend/src/` using an `apps/<portal>` pattern for tenant-defined portals.
- Shared UI, layouts, and hooks go under `src/apps/shared/` or `src/components/` depending on scope.
- Use module path aliases (configured in `vite.config.ts`) to avoid deep relative imports.

## Languages & Tooling

- Author components in JavaScript but keep them TypeScript-ready (JSDoc annotations, typed utility functions). We will migrate to TS later.
- Enforce ESLint (airbnb or custom config) plus Prettier for formatting; run via npm scripts and CI.
- Use modern React features (hooks, suspense-ready patterns). Avoid legacy class components unless necessary.

## Styling & Design System

- Prefer CSS Modules or styled-components to scope styles per component. Keep global styles limited to CSS reset and tokens.
- Consume shared tokens/components from `packages/ui` once available; don’t duplicate design primitives inside apps.
- Ensure responsiveness for desktop/tablet/mobile by default. Document any portal-specific constraints.

## State Management & Data

- Use React Query (or similar) for server state; avoid ad-hoc fetch calls scattered across components.
- Centralize auth/token handling inside a context provider; portals read RBAC claims via hooks.
- Derive types from backend schemas (OpenAPI-generated or shared packages) to keep contracts in sync.

## Security & Accessibility

- Never store sensitive tokens in localStorage; rely on HTTP-only cookies. If non-sensitive tokens must be stored, encrypt and document.
- Sanitize any HTML before rendering; prefer JSX over `dangerouslySetInnerHTML`.
- Enforce accessibility lint rules (jsx-a11y). Each portal must meet WCAG AA baseline.
- Implement rate limiting/throttling client guards for login forms to complement backend controls.

## Testing

- Use Vitest + React Testing Library for unit/component tests; write at least one test per significant component.
- Add Cypress/Playwright E2E coverage per portal once flows stabilize.
- Snapshot tests are acceptable for visual regressions but must accompany behavior tests.

Keep this document updated as we introduce TypeScript, design systems, or new portal patterns.
