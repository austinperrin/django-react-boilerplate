# Portal Routing

## Goal

Describe how login portals map to frontend routes and entry point configuration to ensure consistent behavior across user types.

## Scope

This document focuses on the planned login portal route (`/login/<portal_name>`)
and the planned entry point configuration fetch. Post-login app routing is
handled separately.

## Frontend

- Root path: `/login/:portal_name/*` handled by a top-level router that loads entry point metadata before rendering content (planned).
- Login portal views live under `services/frontend/src/apps/login/<portal_name>/` (or an equivalent structure).
- Shared components (forms, branding, helper text) reside in `src/apps/shared` and receive entry point context.

## Backend

- Entry point definitions stored in database (name, slug, enabled auth methods, default role, feature flags) (planned).
- Endpoint `GET /api/v1/identity/portals/<slug>/` returns entry point configuration consumed by frontend (planned).
- Middleware ensures each request includes a valid portal slug; otherwise rejects with `400` or redirects to default portal (planned).

## Sequence

1. User accesses `/login/vendor`.
2. Frontend loads entry point metadata; if slug invalid, show support contact info.
3. Frontend renders the login portal UI.
4. After authentication, route into post-login app areas based on RBAC claims.
5. Feature flags toggle components within post-login modules.

## Future Enhancements

- Sub-portals (e.g., `/login/faculty/admin`) for nested login experiences.
- Device-specific routing (mobile vs desktop) using user agent or dedicated subdomains.
- Localization of portal content based on tenant/user preferences.

Keep this doc updated as routing libraries or login portal structures evolve.
