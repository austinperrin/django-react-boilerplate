# Testing Policy

## Levels of Testing

1. **Unit Tests**
   - Backend: pytest unit tests targeting models, services, utils.
   - Frontend: Vitest unit tests for pure logic and hooks.
2. **Integration/API Tests**
   - Backend: pytest-django tests hitting DRF endpoints with tenant-aware fixtures.
   - Frontend: component tests combining router + context.
3. **End-to-End (E2E)**
   - Cypress/Playwright flows per portal (login, dashboard, admin actions) once UI stabilizes.
4. **Security/Compliance Checks**
   - Bandit, pip-audit for Python; npm audit, retire.js for frontend.

## Coverage Targets

- Backend: ≥80% line coverage per domain app; critical modules (auth, identity) target 90%.
- Frontend: ≥70% coverage initially, increasing to 80% before GA.
- E2E: cover all critical paths (login, key workflows) with smoke suites running on every release branch.

## Test Data & Fixtures

- Use factory libraries (factory_boy, MSW) to create realistic tenant/user data.
- Never commit real secrets/data; use anonymized fixtures.
- Provide seed scripts under `scripts/bootstrap/` for local dev parity.

## CI Enforcement

- CI pipelines run lint + unit tests on every PR.
- Integration/E2E suites run nightly and on release branches to balance speed vs coverage.
- Failing tests block merges unless explicitly waived via issue + ADR.

## Regression Expectations

- Every bug fix must include at least one new or updated test proving the regression is closed.
- Document edge cases in the corresponding runbook when defects relate to operational procedures.

Review this policy quarterly and update as tooling/test infrastructure evolves.
