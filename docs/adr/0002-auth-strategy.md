# ADR 0002: Authentication Strategy

- **Status**: Accepted
- **Date**: 2025-12-28
- **Owners**: Austin Perrin, contributors

## Context

The backend needs a clear, enterprise-aligned authentication baseline that
supports secure API access, optional enterprise SSO, and user-type policies.
Tenants can define dynamic login portals (entry points) and map them to user
types as needed; these behaviors represent the target architecture rather than
current implementation. The current stack is Django + DRF with a roadmap toward
multi-portal login UX and tenant-specific IAM settings.

## Decision

1. **Primary auth mechanism**: Django REST Framework + SimpleJWT for API
   authentication, issuing JWTs with tenant + entry point context and RBAC claims.
2. **Entry points + user-type policies**: Tenants can define entry points
   (portals) and map user types to those entry points. Auth policy is defined
   at the user-type level and enforced at the entry point, including allowed
   methods (username/password, OIDC, SAML, social providers, magic links, QR
   codes). MFA can be required per user type by the tenant or optional at the
   user level when not mandated.
3. **Enterprise SSO**: Support optional external IdPs via SAML or OIDC, integrated
   as pluggable providers. Tenants configure IdP connections per entry point in a
   settings UI.
4. **Session handling**: Prefer a backend-for-frontend (BFF) session model
   using HTTP-only secure cookies so tokens are never exposed to JavaScript.
   Enforce CSRF protection, short-lived sessions, and refresh/rotation controls.
5. **Domain policies**: Entry points may define allowlists and denylists for
   email domains to control access (e.g., block student domains from staff
   entry points). If unset, access is open to all domains.

## Consequences

- SimpleJWT becomes the default token issuance/validation layer across services.
- External IdP integration is explicit and optional; local credentials remain a
  first-class path.
- User-type policy must include allowed auth methods, MFA requirements (tenant
  required vs user opt-in), and optional domain policies to enforce entry-point
  access rules.

## Alternatives Considered

- Django session auth only (not suitable for SPA + API boundaries).
- Third-party auth platforms as a required dependency (rejected for flexibility).

## Follow-Up

- Define the JWT claim schema (tenant, entry point, roles, permissions).
- Document supported IdP integrations and their configuration requirements.
- Define entry-point and user-type auth policy models (methods, MFA requirement,
  domain rules, user opt-in behavior).
- Add an ADR if adopting a specific SAML/OIDC provider library.
