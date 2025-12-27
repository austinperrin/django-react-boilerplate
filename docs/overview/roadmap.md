# Internal Roadmap

Milestone-based roadmap for internal development. Each milestone is sequential
and should be completed before moving to the next. Use these milestones to align
GitHub milestones, issues, and labels. This is a living document and should be
updated as scope, decisions, and timelines evolve.

## Schedule

| Milestone | Estimate |
| --- | --- |
| [Milestone 1: Repository and Baseline Setup](#milestone-1-repository-and-baseline-setup) | 2-3 weeks |
| [Milestone 2: Identity and Common Scaffolding](#milestone-2-identity-and-common-scaffolding) | 2-3 weeks |
| [Milestone 3: Authentication and RBAC Core](#milestone-3-authentication-and-rbac-core) | 2-4 weeks |
| [Milestone 4: Portal UX + RBAC Enforcement](#milestone-4-portal-ux--rbac-enforcement) | 2-4 weeks |
| [Milestone 5: Shared Packages and Contracts](#milestone-5-shared-packages-and-contracts) | 2-3 weeks |
| [Milestone 6: Automation and CI/CD](#milestone-6-automation-and-cicd) | 1-2 weeks |
| [Milestone 7: Infrastructure and Deployment](#milestone-7-infrastructure-and-deployment) | 2-4 weeks |
| [Milestone 8: Hardening and GA Readiness](#milestone-8-hardening-and-ga-readiness) | 2-3 weeks |

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
  - [ ] Record initial ADRs (repo structure, auth strategy placeholder).
  - [x] Register repo automation agents, if any.
  - [x] Add CODEOWNERS and issue templates.
  - [x] Define contribution guide and repo overview (README structure).
  - [ ] Decide workspace/package manager strategy and record via ADR.
- Backend
  - [x] Define backend structure and settings layout.
  - [x] Add base requirements and tooling config references.
  - [ ] Wire linting/formatting/type-checking config.
  - [x] Add scripts/utilities guidance for local dev helpers.
- Frontend
  - [x] Define frontend structure and tooling conventions.
  - [ ] Wire ESLint/Prettier config and reference from frontend tooling.
  - [ ] Scaffold frontend app shell (package.json, Vite project, base routing, lint/format scripts).
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
- [ ] Review docs for consistency and cross-links.
- [ ] Update ADRs for new decisions.
- [ ] Verify scripts/configs align with documented standards.
- [ ] Confirm milestone goal and exit criteria are met.
- [ ] Update roadmap items and mark completed tasks.

## Milestone 2: Identity and Common Scaffolding

Goal: Establish core backend domain scaffolding (common + identity) so migrations
and base models are ready before authentication flows are added.

Checklist:
- Backend
  - [ ] Implement `common` domain app (shared utilities, health checks).
  - [ ] Implement `identity` domain app (custom user model, tenants, portals).
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

Goal: Deliver a working authentication system with tenant/portal context and a
starter RBAC model to unlock secured API access.

Checklist:
- Security
  - [x] Document RBAC roles/permissions and auth policies.
  - [x] Document IAM strategy (MFA, SSO requirements).
- Backend
  - [ ] Create portal metadata endpoint (`/api/v1/identity/portals/<slug>/`).
  - [ ] Implement auth endpoints (`/api/v1/identity/auth/*`).
  - [ ] Issue JWTs with tenant + portal context and claims.
  - [ ] Seed RBAC roles/permissions.
  - [ ] Add audit logging for auth events.
  - [ ] Disable Django admin and enforce secure defaults.
- Frontend
  - [ ] Add basic auth client plumbing for login.
  - [ ] Add placeholder login UI flow for a single portal.

Exit criteria:
- End-to-end login works for a single portal.
- Authenticated API requests are enforced by default.

Milestone review checklist:
- [ ] Review docs for consistency and cross-links.
- [ ] Update ADRs for new decisions.
- [ ] Verify scripts/configs align with documented standards.
- [ ] Confirm milestone goal and exit criteria are met.
- [ ] Update roadmap items and mark completed tasks.

## Milestone 4: Portal UX + RBAC Enforcement

Goal: Enable portal-specific experiences with RBAC-aware routing and UI so user
roles map cleanly to visible features.

Checklist:
- Docs/Standards
  - [x] Document portal UX expectations and routing conventions.
  - [ ] Decide API contracts approach (OpenAPI vs shared types) and capture via ADR.
- Backend
  - [ ] Enforce RBAC permissions on protected endpoints.
- Frontend
  - [ ] Implement portal routing (`/portal/<slug>`).
  - [ ] Add auth/RBAC context provider.
  - [ ] Gate routes and UI based on RBAC claims.
  - [ ] Provide two example portals to validate structure.
- QA/Testing
  - [ ] Add basic portal routing tests and RBAC checks.
- Backend (Optional)
  - [ ] Expose feature flag configuration per portal.
- Frontend (Optional)
  - [ ] Wire feature flags from backend.

Exit criteria:
- Two portals render with distinct navigation and access rules.
- Unauthorized API/UI actions are blocked consistently.

Milestone review checklist:
- [ ] Review docs for consistency and cross-links.
- [ ] Update ADRs for new decisions.
- [ ] Verify scripts/configs align with documented standards.
- [ ] Confirm milestone goal and exit criteria are met.
- [ ] Update roadmap items and mark completed tasks.

## Milestone 5: Shared Packages and Contracts

Goal: Centralize shared contracts and auth/RBAC definitions to reduce drift across
services and portals.

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

## Milestone 6: Automation and CI/CD

Goal: Automate quality gates so builds, tests, and security checks run consistently
before releases.

Checklist:
- Docs/Standards
  - [ ] Document release and deployment flow.
  - [ ] Document CI expectations and required checks.
- Backend
  - [x] Add backend test runner scripts.
  - [ ] Enforce lint/type checks in CI.
- Frontend
  - [ ] Add frontend test runner scripts.
  - [ ] Enforce lint checks in CI.
- Infra/DevOps
  - [ ] Define CI workflows (lint, test, build) and replace placeholder jobs.
  - [ ] Route CI tasks through `scripts/ci/` wrappers.
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

## Milestone 7: Infrastructure and Deployment

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

## Milestone 8: Hardening and GA Readiness

Goal: Validate reliability and security to reach GA-ready quality for a tenant
deployment.

Checklist:
- Security
  - [ ] Threat model review and security checklist review.
- Backend
  - [ ] Performance testing for API flows.
  - [ ] Implement structured logging and audit events.
- Frontend
  - [ ] Performance testing for portal flows.
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

- Mobile clients and device-specific portals.
- Backend service decomposition (domain-specific services).
- Advanced analytics, billing, and tenant dashboards.
- Multi-region or disaster-recovery automation.
