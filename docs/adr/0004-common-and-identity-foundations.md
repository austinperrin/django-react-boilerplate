# ADR 0004: Common & Identity Domain Foundations

- **Status**: Accepted
- **Date**: 2026-02-01
- **Owners**: Austin Perrin, contributors

## Context

We want clear, minimal foundations for the `common` and `identity` domains
before expanding authentication flows and IAM features. The foundations should
establish an email-first custom user model and shared base models for UUIDs,
timestamps, and audit attribution. Identity-related models (profiles, IAM
providers) should have clear placeholders while remaining flexible for later
implementation details.

## Decision

1. **Custom user model**
   - Implement a custom user model using `AbstractBaseUser` + `PermissionsMixin`.
   - Use email as the unique login identifier (`USERNAME_FIELD = "email"`).
   - Provide a custom `UserManager` with `create_user` and `create_superuser`.
   - Keep the model minimal but extensible (e.g., `first_name`, `last_name`,
     `verified_at`, `is_active`, `is_staff`), aligning with enterprise IAM needs.
   - Configure `AUTH_USER_MODEL` in Django settings once the app is scaffolded.

2. **Common base models**
   - Add a `BaseModel` abstract class with:
     - UUID primary key (`id`)
     - `created_at` and `updated_at` timestamps
   - Add an `AuditModel` abstract class with:
     - `created_by` and `updated_by` foreign keys to `AUTH_USER_MODEL`
   - These live under `apps/common/models/` and are used across domains.

3. **Identity domain scaffolding**
   - Scaffold the `identity` app with:
     - `User` model (custom user implementation).
     - `Profile` model placeholder (public profile data).
     - `IAMProvider` model placeholder (IdP configuration).
     - `IAMExternalIdentity` model placeholder (IdP-linked credentials).
   - Identity-related models beyond the `User` are **described and planned** but
     may be implemented later as the IAM/RBAC scope expands.

## Consequences

- We establish an email-first auth foundation and consistent base models early.
- UUIDs and timestamps become the default for new tables, enabling consistent
  auditing and change tracking.
- The codebase is ready for future IAM, RBAC, and audit requirements without
  locking in implementation details prematurely.

## Follow-Up

1. Scaffold `apps/common` and `apps/identity` with the agreed base classes and
   custom user model.
2. Update Django settings to register the `identity` app and `AUTH_USER_MODEL`
   once the `User` model is in place.
3. Expand identity models (profile, IAM providers/identities) as IAM scope
   evolves.
