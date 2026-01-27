# Automation Scripts

Central location for developer tooling and CI helpers (bootstrap commands, lint/test wrappers, scaffolding utilities).

## Conventions

- Use descriptive filenames (`bootstrap_env.sh`, `lint_backend.py`).
- Keep scripts idempotent and safe to run multiple times.
- Prefer POSIX shell or Python for portability; document interpreter requirements at the top of each script.
- Store environment-agnostic configuration in `configs/`; scripts read from there rather than hardcoding values.
- Include usage examples and expected environment variables in script comments.

## Structure

```
scripts/
├── README.md
├── bootstrap/         # environment setup helpers
├── dev/               # local, Docker-first workflows
├── ci/                # wrappers invoked by CI/CD pipelines
└── utilities/         # ad-hoc tooling (e.g., scaffolding commands)
```

Add subdirectories as tooling grows; each should have its own README if non-trivial.

## Next Steps

- Identify common workflows (e.g., `scripts/bootstrap/dev.sh`, `scripts/dev/backend-checks.sh`).
- Align with CI provider (GitHub Actions) by referencing these scripts in workflow files.
- Ensure scripts are executable (`chmod +x`) and linted (shellcheck, etc.).
