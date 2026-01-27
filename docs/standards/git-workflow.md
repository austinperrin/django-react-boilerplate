# Git Workflow Standard

## Branching Strategy

- `main` always reflects the latest tenant-ready release; protect it with required CI and no direct pushes.
- Work happens on topic branches named using prefixes:
  - `feat/<area>-<short-description>` for new features.
  - `fix/<area>-<issue-id>` for bug fixes.
  - `chore/<area>-<task>` for maintenance.
- Long-running branches are discouraged; merge back frequently to avoid drift.

## Pull Requests

- Every change, including solo work, must go through a PR.
- Include description, linked issues/ADRs, and testing evidence (commands run, screenshots if UI).
- Keep PRs under ~300 LOC when possible; split into stacked PRs for large initiatives.
- Request at least one review; if working alone, perform a self-review checklist and document it in the PR description.

## Releases

- Tag releases as `vMAJOR.MINOR.PATCH` following semantic versioning.
- Create `release/vX.Y` branches only when a patch needs backporting; otherwise tag `main` directly.
- Maintain `CHANGELOG.md` summarizing noteworthy changes per release.

## Hotfixes

- Branch from the relevant release tag or `main` if the bug exists there.
- Use `hotfix/<issue>` naming; after verification, merge back into both `main` and any supported release branches.

## Additional Notes

- Reference ADR IDs in PR titles/descriptions when the change implements a recorded decision.
- Use draft PRs for early feedback but run lint/tests locally first to avoid noisy CI failures.
