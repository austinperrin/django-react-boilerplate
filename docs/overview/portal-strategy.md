# Portal Strategy

## Goals

- Provide distinct login/landing experiences per user type while sharing the same backend/APIs.
- Allow tenants to configure which portals are available and which auth methods each portal accepts.
- Ensure admin functions blend into regular UI but are only visible when roles permit.

## Portal Definition

- Portals are identified by a slug (e.g., `parent`, `student`, `vendor`) and map to front-end entry points such as `/portal/<slug>`.
- Metadata per portal:
  - Display name & branding overrides.
  - Allowed authentication providers (username/password, social, SAML, etc.).
  - Default RBAC role assigned on self-registration (if allowed).
  - Feature flags controlling navigation/components.

## Backend Responsibilities

- Serve portal configuration via a read-only API consumed by the frontend at runtime.
- Enforce portal-specific auth policies (e.g., admins must use SAML, vendors may use magic links) before issuing JWTs.
- Tag JWTs with portal context so frontend can enforce correct UI states.

## Frontend Responsibilities

- Client bootstraps by fetching portal metadata, then dynamically loads the matching portal module under `src/apps/<portal>/`.
- RBAC-aware components render/disable features based on roles + portal context.
- Shared components live under `src/apps/shared` to avoid duplication.

## Future Considerations

- Native clients (iOS/Android) can reuse the same portal definitions by referencing the API.
- Add analytics to track portal usage per tenant for capacity planning and billing.

Update this document as additional portal types or device-specific clients are introduced.
