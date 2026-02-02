# Authentication Flow

## Overview

This document describes the planned end-to-end authentication flow for login
portal users, highlighting backend and frontend responsibilities.

## Steps

1. **Portal Discovery**
   - User hits `/login/<portal_name>`.
   - Frontend fetches entry point metadata (allowed auth methods, branding) from backend (`/api/v1/identity/portals/<slug>/`) (planned).
2. **Credential Input**
   - Frontend renders appropriate UI based on metadata (username/password form, SSO button, magic link request, etc.).
3. **Auth Request**
   - Credentials/SSO tokens are sent to backend endpoints under `/api/v1/identity/auth/<method>/` (planned).
   - Backend enforces entry point policies (e.g., admins require SAML) (planned).
4. **Verification & Issuance**
   - Backend validates credentials against configured providers (Django auth, IdP, social login) (planned).
   - On success, backend issues a JWT containing tenant ID, entry point slug, roles, and claims (planned).
5. **Session Establishment**
   - Frontend receives JWT via HTTP-only cookie or secure storage.
   - Client initializes auth context and fetches user profile data (planned).
6. **Authorization Checks**
   - Each API call includes JWT; backend validates signature, expiry, and entry point context (planned).
   - RBAC policy determines access; forbidden actions return `403` with audit logging (planned).

## Notes

- MFA flows insert additional steps (challenge + verify) before issuance.
- Magic link flows require email delivery; tokens must be single-use and expire quickly.
- Document error handling (rate limiting, lockouts) as implementation details become available.

Use this doc when designing auth endpoints, frontend contexts, or security runbooks.
