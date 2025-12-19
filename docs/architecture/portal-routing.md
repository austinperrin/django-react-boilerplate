# Portal Routing

## Goal

Describe how portals map to frontend routes and backend configuration to ensure consistent behavior across user types.

## Frontend

- Root path: `/portal/:slug/*` handled by a top-level router that loads portal metadata before rendering content.
- Portal modules live under `services/frontend/src/apps/<slug>/`. Each module exports:
  - Route definitions (dashboard, settings, etc.).
  - Required features/permissions.
  - Optional overrides (layouts, branding tokens).
- Shared components (navigation, cards) reside in `src/apps/shared` and receive portal context.

## Backend

- Portal definitions stored in database (name, slug, enabled auth methods, default role, feature flags).
- Endpoint `GET /api/v1/identity/portals/<slug>/` returns configuration consumed by frontend.
- Middleware ensures each request includes a valid portal slug; otherwise rejects with `400` or redirects to default portal.

## Sequence

1. User accesses `/portal/vendor`.
2. Frontend loads portal metadata; if slug invalid, show support contact info.
3. Frontend mounts `apps/vendor` routes and renders login screen.
4. After authentication, router guards check RBAC claims before allowing navigation to protected routes.
5. Feature flags toggle components within the portal module.

## Future Enhancements

- Sub-portals (e.g., `/portal/faculty/admin`) for nested experiences.
- Device-specific routing (mobile vs desktop) using user agent or dedicated subdomains.
- Localization of portal content based on tenant/user preferences.

Keep this doc updated as routing libraries or portal structures evolve.
