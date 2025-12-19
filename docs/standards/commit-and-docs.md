# Commit & Documentation Standards

## Commit Messages

- Follow Conventional Commits (`feat:`, `fix:`, `chore:`, `docs:`, `refactor:`, etc.).
- Subject line ≤72 characters; include context in body (why/how) when changes aren’t obvious.
- Reference issues/ADRs with `Refs #123` or `ADR-0001` in the body.
- Squash commits if the history is noisy, but keep meaningful logical units (e.g., separate `feat` and `chore`).

## Pull Request Hygiene

- Template should include summary, testing evidence, screenshots for UI, and rollout/risk notes.
- Ensure `TODO`/`FIXME` comments are resolved or tracked before merging.
- Run lint/tests locally prior to pushing; annotate PR with results if CI is pending.

## Documentation Updates

- Any change affecting architecture or workflows requires an ADR update or new ADR.
- Update relevant docs (`docs/overview`, `docs/security`, `docs/runbooks`) when features touch those areas.
- Keep `docs/index.md` and folder READMEs current so doc discoverability stays high.
- Add configuration changes to `configs/` templates and mention them in release notes.

## Review Expectations

- Reviewers focus on correctness, security, maintainability, and documentation coverage.
- Use GitHub suggestions for minor fixes; avoid “nit” comments without rationale.
- Approvals require verifying that standards in this folder are satisfied; if not, request changes with actionable guidance.

Keep this document aligned with CONTRIBUTING guidelines once that file is introduced.
