# Frontend Service

React (JavaScript) app powered by Vite. Serves as the primary user interface layer for tenant-defined portals (e.g., student, parent, vendor) and interacts with the Django/DRF API.

## Goals

- Single codebase with RBAC-aware feature flags so different user types see the correct UI.
- Support multiple portal entry points driven by tenant configuration (e.g., `/login/<portal_name>`).
- Secure-by-default client: strict TypeScript-ready tooling (even if starting in JS), linting, dependency auditing.
- Pluggable auth flows (username/password, magic links, social, enterprise SSO) backed by backend configuration.

## Layout

The Vite app shell is scaffolded. The structure below describes the target
layout as portal/login flows and shared modules are introduced.

```
services/frontend/
├── src/
│   ├── apps/
│   │   ├── shared/        # shared layouts, widgets, design system bindings
│   │   └── <portal>/      # dynamically defined portal entrypoints per tenant config
│   ├── components/        # base components not tied to a portal
│   ├── hooks/             # API/RBAC/state hooks
│   ├── routes/            # router definitions per portal
│   ├── services/          # API clients (generated or handwritten)
│   └── styles/
├── public/
├── vite.config.ts         # configure aliases, env handling, security headers
└── package.json
```

## Conventions

- Use React Router (or equivalent) to partition portals; enforce RBAC in route guards/components.
- Centralize API calls via typed client modules; share DTO definitions via `packages/` when possible.
- Persist auth tokens securely (HTTP-only cookies preferred; localStorage only for non-sensitive metadata).
- Feature flagging by user type/role should be done via context providers that consume backend-issued claims.

## Security & Quality

- Enforce ESLint + Prettier + unit tests (Vitest/Testing Library) via CI.
- Run `npm run lint` and `npm run format:check`; configs live at repo root.
- Leverage Content Security Policy and other headers via reverse proxy or Vite middleware.
- Run dependency scanning (e.g., `npm audit`) as part of pipelines.
- Document tenant-defined portal UX and flows under `docs/overview/` once defined.

## Next Steps

- Decide on routing/portal strategy (single router vs multi-root apps) via ADR.
- Scaffold shared auth/RBAC context that aligns with backend JWT payloads.
- Integrate storybook or equivalent once a design system is in `packages/`.
- Add login portal UI flows (`/login/<portal_name>`) in the auth milestone.
