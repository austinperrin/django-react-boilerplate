# Post-Login Routing

## Goal

Describe how authenticated users are routed into post-login app areas after a
successful login portal flow.

## Scope

This document covers route structure, RBAC gating, and feature flags for
post-login experiences. It does not define login portal behavior.

## Frontend

- Post-login routes live under a dedicated router (e.g., `/app/*`).
- App areas map to modules under `services/frontend/src/apps/<area>/`.
- Route guards use RBAC claims from the JWT to allow or block navigation (planned).
- Feature flags toggle UI at the module or component level (planned).

## Backend

- JWT claims include tenant ID, entry point slug, roles, and permissions (planned).
- Protected endpoints enforce RBAC server-side regardless of client routing (planned).

## Next Steps

- Decide on the final post-login route prefix (`/app`, `/home`, or root-based).
- Define example app areas and their RBAC requirements.
