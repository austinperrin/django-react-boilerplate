# Portal Strategy

## Goals

- Provide distinct login experiences per user type while sharing the same backend/APIs.
- Allow tenants to configure which login portals are available and which auth methods each entry point accepts.
- Ensure admin functions blend into regular UI but are only visible when roles permit.

## Scope

This document covers product intent and tenant configuration for dynamic login
portals. Post-login app areas are described in architecture docs.

## Portal Definition

- Portals are identified by a slug (e.g., `parent`, `student`, `vendor`) and map to login routes such as `/login/<portal_name>`.
- Entry point metadata (configured per login portal):
  - Display name & branding overrides.
  - Allowed authentication providers (username/password, social, SAML, etc.).
  - Default RBAC role assigned on self-registration (if allowed).
  - Feature flags controlling navigation/components.

## Backend Responsibilities

- Serve entry point configuration via a read-only API consumed by the frontend at runtime.
- Enforce entry point auth policies (e.g., admins must use SAML, vendors may use magic links) before issuing JWTs.
- Tag JWTs with entry point context so frontend can enforce correct UI states.

## Frontend Responsibilities

- Client bootstraps by fetching entry point metadata, then renders the matching login portal UI.
- After authentication, route into post-login app areas using roles + entry point context.
- Shared components live under `src/apps/shared` to avoid duplication.

See `docs/architecture/login-portal-routing.md` for implementation details.

## Future Considerations

- Native clients (iOS/Android) can reuse the same portal definitions by referencing the API.
- Add analytics to track login portal usage per tenant for capacity planning and billing.

Update this document as additional login portal types or device-specific clients are introduced.
