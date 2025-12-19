# Identity & Access Management Strategy

## User Store

- Default to Django auth models (User, Group, Permission) extended via profiles for tenant-specific data.
- Each tenant has its own superuser/tenant-admin accounts; no cross-tenant data.

## Authentication Methods

- Username/password with configurable policies (length, complexity, rotation).
- Magic links for low-privilege roles if tenant enables them.
- Social logins (OAuth2 providers) configured per tenant.
- Enterprise IAM (SAML, OpenID Connect, ADFS, Microsoft Entra ID) required for privileged/admin roles.

## Multi-Factor Authentication

- Mandatory for `tenant-admin`, `support`, and any role with access to sensitive data.
- Backends should support TOTP and hardware keys (WebAuthn) via pluggable modules.

## Authorization

- RBAC definitions stored centrally (see RBAC matrix doc). Backend enforces permissions per endpoint; frontend uses claims only for UX hints.
- Service-to-service communications (future) authenticated via mTLS or signed tokens with scoped permissions.

## Portal-Specific Policies

- Each portal declares which auth methods are allowed. Backend validates the portal context before issuing JWTs.
- Admin interfaces only exposed within existing portals; UI respects RBAC flags to hide privileged functionality.

## Auditing & Logging

- Record all login attempts (success/failure) with tenant, portal, and source metadata.
- Track permission changes, role assignments, and SSO configuration updates.
- Retain logs per compliance requirements; support export to tenant SIEMs if needed.

Document integrations and configuration steps per provider as they are implemented.
