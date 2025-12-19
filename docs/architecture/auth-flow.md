# Authentication Flow

## Overview

This document describes the end-to-end authentication flow for portal users, highlighting backend and frontend responsibilities.

## Steps

1. **Portal Discovery**
   - User hits `/portal/<slug>`.
   - Frontend fetches portal metadata (allowed auth methods, branding) from backend (`/api/v1/identity/portals/<slug>/`).
2. **Credential Input**
   - Frontend renders appropriate UI based on metadata (username/password form, SSO button, magic link request, etc.).
3. **Auth Request**
   - Credentials/SSO tokens are sent to backend endpoints under `/api/v1/identity/auth/<method>/`.
   - Backend enforces portal-specific policies (e.g., admins require SAML).
4. **Verification & Issuance**
   - Backend validates credentials against configured providers (Django auth, IdP, social login).
   - On success, backend issues a JWT containing tenant ID, portal slug, roles, and claims.
5. **Session Establishment**
   - Frontend receives JWT via HTTP-only cookie or secure storage.
   - Client initializes auth context and fetches user profile data.
6. **Authorization Checks**
   - Each API call includes JWT; backend validates signature, expiry, and portal context.
   - RBAC policy determines access; forbidden actions return `403` with audit logging.

## Notes

- MFA flows insert additional steps (challenge + verify) before issuance.
- Magic link flows require email delivery; tokens must be single-use and expire quickly.
- Document error handling (rate limiting, lockouts) as implementation details become available.

Use this doc when designing auth endpoints, frontend contexts, or security runbooks.
