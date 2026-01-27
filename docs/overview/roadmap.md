# Internal Roadmap

Milestone-based roadmap for internal development. Each milestone is sequential
and should be completed before moving to the next. Use these milestones to align
GitHub milestones, issues, and labels. This is a living document and should be
updated as scope, decisions, and timelines evolve.

## Schedule

| Milestone | Estimate | Status |
| --- | --- | --- |
| [Milestone 1: Repository and Baseline Setup](#milestone-1-repository-and-baseline-setup) | 2-3 weeks | Completed |
| [Milestone 2: Identity and Common Scaffolding](#milestone-2-identity-and-common-scaffolding) | 2-3 weeks | Planned |
| [Milestone 3: Authentication and RBAC Core](#milestone-3-authentication-and-rbac-core) | 2-4 weeks | Planned |
| [Milestone 4: Login Portal UX](#milestone-4-login-portal-ux) | 1-2 weeks | Planned |
| [Milestone 5: Post-Login UX + RBAC Enforcement](#milestone-5-post-login-ux--rbac-enforcement) | 2-4 weeks | Planned |
| [Milestone 6: Shared Packages and Contracts](#milestone-6-shared-packages-and-contracts) | 2-3 weeks | Planned |
| [Milestone 7: Automation and CI/CD](#milestone-7-automation-and-cicd) | 1-2 weeks | Planned |
| [Milestone 8: Infrastructure and Deployment](#milestone-8-infrastructure-and-deployment) | 2-4 weeks | Planned |
| [Milestone 9: Hardening and GA Readiness](#milestone-9-hardening-and-ga-readiness) | 2-3 weeks | Planned |

## Milestone 1: Repository and Baseline Setup

Goal: Establish the repo structure, standards, and local dev workflow so contributors
can work consistently from day one.

Checklist:
- Docs/Standards
  - [x] Define documentation index and navigation.
  - [x] Establish backend standards.
  - [x] Establish frontend standards.
  - [x] Establish testing policy and coverage targets.
  - [x] Establish infra standards (Docker, env files, .dockerignore).
  - [x] Establish git workflow and commit/documentation standards.
  - [x] ADR: initial decisions (repo structure, auth strategy placeholder).
  - [x] ADR: workspace/package manager strategy.
  - [x] Register repo automation agents, if any.
  - [x] Add CODEOWNERS and issue templates.
  - [x] Define contribution guide and repo overview (README structure).
- Backend
  - [x] Define backend structure and settings layout.
  - [x] Add base requirements and tooling config references.
  - [x] Wire linting/formatting/type-checking config.
  - [x] Add scripts/utilities guidance for local dev helpers.
- Frontend
  - [x] Define frontend structure and tooling conventions.
  - [x] Wire ESLint/Prettier config and reference from frontend tooling.
  - [x] Scaffold frontend app shell (package.json, Vite project, lint/format scripts).
- Infra/DevOps
  - [x] Add initial Docker dev workflow and service Dockerfiles.
  - [x] Add per-service `.dockerignore` files.
  - [x] Add env templates and configuration conventions.
  - [x] Add bootstrap scripts for local setup.
  - [x] Add placeholder CI workflow and repo automation scaffolding.

Exit criteria:
- Docs are discoverable and consistent across `docs/`.
- Local dev workflow is documented and repeatable.

Milestone review checklist:
- [x] Review docs for consistency and cross-links.
- [x] Update ADRs for new decisions.
- [x] Verify scripts/configs align with documented standards.
- [x] Confirm milestone goal and exit criteria are met.
- [x] Update roadmap items and mark completed tasks.

## Milestone 2: Identity and Common Scaffolding

Goal: Establish core backend domain scaffolding (common + identity) so migrations
and base models are ready before authentication flows are added.

Checklist:
- Docs/Standards
  - [ ] ADR: custom user model strategy (AbstractUser vs AbstractBaseUser).
  - [ ] ADR: tenant + entry point data model.
- Backend
  - [ ] Implement `common` domain app (shared utilities, health checks).
  - [ ] Implement `identity` domain app (custom user model, tenants, entry points).
  - [ ] Define custom user model before initial migrations are created.
  - [ ] Create initial migrations for identity domain models.

Exit criteria:
- Common and identity apps are scaffolded with initial migrations.
- Health checks and base utilities are available for future endpoints.

Milestone review checklist:
- [ ] Review docs for consistency and cross-links.
- [ ] Update ADRs for new decisions.
- [ ] Verify scripts/configs align with documented standards.
- [ ] Confirm milestone goal and exit criteria are met.
- [ ] Update roadmap items and mark completed tasks.

## Milestone 3: Authentication and RBAC Core

Goal: Deliver a working authentication system with tenant/entry-point context and a
starter RBAC model to unlock secured API access.

Checklist:
- Security
  - [x] Document RBAC roles/permissions and auth policies.
  - [x] Document IAM strategy (MFA, SSO requirements).
- Docs/Standards
  - [ ] ADR: MFA enforcement model (tenant-required vs user opt-in).
  - [ ] ADR: token storage/session strategy (BFF cookies, rotation, CSRF).
  - [ ] ADR: auth provider integration approach (OIDC/SAML).
  - [ ] ADR: JWT claim schema.
- Backend
  - [ ] Create entry point metadata endpoint (`/api/v1/identity/portals/<slug>/`).
  - [ ] Implement auth endpoints (`/api/v1/identity/auth/*`).
  - [ ] Issue JWTs with tenant + entry point context and claims.
  - [ ] Seed RBAC roles/permissions.
  - [ ] Add audit logging for auth events.
  - [ ] Disable Django admin and enforce secure defaults.
- Frontend
  - [ ] Add basic auth client plumbing for login.

Exit criteria:
- Authenticated API requests are enforced by default.

Milestone review checklist:
- [ ] Review docs for consistency and cross-links.
- [ ] Update ADRs for new decisions.
- [ ] Verify scripts/configs align with documented standards.
- [ ] Confirm milestone goal and exit criteria are met.
- [ ] Update roadmap items and mark completed tasks.

## Milestone 4: Login Portal UX

Goal: Deliver tenant-configurable login portals with entry point-specific auth
options and a basic UX flow.

Checklist:
- Docs/Standards
  - [ ] ADR: entry point domain allow/deny policy model.
- Frontend
  - [ ] Implement login portal routing (`/login/<portal_name>`).
  - [ ] Build portal-specific login UI from entry point config.
  - [ ] Add invalid portal handling and support messaging.
- QA/Testing
  - [ ] Add login portal flow smoke tests.

Exit criteria:
- End-to-end login works for a single login portal.
- Portal UI reflects tenant-configured auth options.

Milestone review checklist:
- [ ] Review docs for consistency and cross-links.
- [ ] Update ADRs for new decisions.
- [ ] Verify scripts/configs align with documented standards.
- [ ] Confirm milestone goal and exit criteria are met.
- [ ] Update roadmap items and mark completed tasks.

## Milestone 5: Post-Login UX + RBAC Enforcement

Goal: Enable post-login experiences with RBAC-aware routing and UI so user
roles map cleanly to visible features.

Checklist:
- Docs/Standards
  - [x] Document login portal UX expectations and routing conventions.
  - [ ] ADR: post-login route strategy.
  - [ ] ADR: API contracts approach (OpenAPI vs shared types).
- Backend
  - [ ] Enforce RBAC permissions on protected endpoints.
- Frontend
  - [ ] Implement post-login app routing.
  - [ ] Add auth/RBAC context provider.
  - [ ] Gate routes and UI based on RBAC claims.
  - [ ] Provide two example post-login app areas to validate structure.
- QA/Testing
  - [ ] Add basic post-login routing tests and RBAC checks.
- Backend (Optional)
  - [ ] Expose feature flag configuration per entry point or app area.
- Frontend (Optional)
  - [ ] Wire feature flags from backend.

Exit criteria:
- Two post-login app areas render with distinct navigation and access rules.
- Unauthorized API/UI actions are blocked consistently.

Milestone review checklist:
- [ ] Review docs for consistency and cross-links.
- [ ] Update ADRs for new decisions.
- [ ] Verify scripts/configs align with documented standards.
- [ ] Confirm milestone goal and exit criteria are met.
- [ ] Update roadmap items and mark completed tasks.

## Milestone 6: Shared Packages and Contracts

Goal: Centralize shared contracts and auth/RBAC definitions to reduce drift across
services and login portals.

Checklist:
- Docs/Standards
  - [ ] Document package ownership and release/versioning process.
- Infra/DevOps
  - [ ] Define shared `packages/` layout and tooling.
  - [ ] Create `packages/rbac` and `packages/auth` stubs.
  - [ ] Add shared config schema or types for contracts.
- Backend
  - [ ] Consume shared RBAC definitions in permission checks.
- Frontend
  - [ ] Consume shared RBAC definitions for UI gating.

Exit criteria:
- Shared packages are consumed by backend and frontend.
- Contracts are centralized and documented.

Milestone review checklist:
- [ ] Review docs for consistency and cross-links.
- [ ] Update ADRs for new decisions.
- [ ] Verify scripts/configs align with documented standards.
- [ ] Confirm milestone goal and exit criteria are met.
- [ ] Update roadmap items and mark completed tasks.

## Milestone 7: Automation and CI/CD

Goal: Automate quality gates so builds, tests, and security checks run consistently
before releases.

Checklist:
- Docs/Standards
  - [ ] Document release and deployment flow.
  - [ ] Document CI expectations and required checks.
  - [ ] ADR: CI pipeline standards (required checks, ordering, artifacts).
- Backend
  - [x] Add backend test runner scripts.
  - [ ] Enforce lint/type checks in CI.
- Frontend
  - [ ] Add frontend test runner scripts.
  - [ ] Enforce lint checks in CI.
- Infra/DevOps
  - [ ] Define CI workflows (lint, test, build) and replace placeholder jobs.
  - [ ] Route CI tasks through `scripts/ci/` wrappers and local checks through `scripts/dev/`.
  - [ ] Add security scans (pip-audit, npm audit).

Exit criteria:
- CI is required for merges and blocks failing checks.
- Security scans are part of the default pipeline.

Milestone review checklist:
- [ ] Review docs for consistency and cross-links.
- [ ] Update ADRs for new decisions.
- [ ] Verify scripts/configs align with documented standards.
- [ ] Confirm milestone goal and exit criteria are met.
- [ ] Update roadmap items and mark completed tasks.

## Milestone 8: Infrastructure and Deployment

Goal: Make tenant provisioning and deployment repeatable with clear runbooks and
infrastructure automation.

Checklist:
- Docs/Standards
  - [x] Define tenant deployment topology and environment targets.
  - [x] Document secrets manager integration.
  - [x] Add deployment runbook and health checks.
  - [x] Add incident response runbook.
  - [x] Add backup/restore runbook and secrets rotation notes.
  - [ ] Add tenant onboarding/offboarding runbook.
- Infra/DevOps
  - [x] Add IaC scaffolding (Terraform or chosen tool).
  - [ ] Implement initial Terraform modules and remove placeholders.
  - [ ] Validate backup/restore process.
- Security
  - [ ] Verify deployment aligns with security baseline.

Exit criteria:
- Tenant can be provisioned and deployed end-to-end.
- Runbooks cover deployment, incident response, and backups.

Milestone review checklist:
- [ ] Review docs for consistency and cross-links.
- [ ] Update ADRs for new decisions.
- [ ] Verify scripts/configs align with documented standards.
- [ ] Confirm milestone goal and exit criteria are met.
- [ ] Update roadmap items and mark completed tasks.

## Milestone 9: Hardening and GA Readiness

Goal: Validate reliability and security to reach GA-ready quality for a tenant
deployment.

Checklist:
- Security
  - [ ] Threat model review and security checklist review.
- Backend
  - [ ] Performance testing for API flows.
  - [ ] Implement structured logging and audit events.
- Frontend
  - [ ] Performance testing for login portals and post-login flows.
- Infra/DevOps
  - [ ] Observability baseline (logs, metrics, alerts).
  - [ ] Define log retention and alerting thresholds.
- QA/Testing
  - [ ] Regression tests for core flows.

Exit criteria:
- Security checklist passes for a test tenant.
- Monitoring and incident response are validated.

Milestone review checklist:
- [ ] Review docs for consistency and cross-links.
- [ ] Update ADRs for new decisions.
- [ ] Verify scripts/configs align with documented standards.
- [ ] Confirm milestone goal and exit criteria are met.
- [ ] Update roadmap items and mark completed tasks.

## Extended Roadmap

- Mobile clients and device-specific frontends (e.g., dedicated Android/iOS apps).
- Backend service decomposition (domain-specific services).
- Advanced analytics, billing, and tenant dashboards.
- Multi-region or disaster-recovery automation.
