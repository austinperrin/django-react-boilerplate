# Agent Registry

Catalog of automated agents or AI helpers operating in this repo. Update
whenever introducing or retiring agents.

## Template

| Agent | Role | Trigger | Inputs | Outputs | Secrets |
|-------|------|---------|--------|---------|---------|
| `agent-name` | Short description | e.g., GitHub Action workflow dispatch | Files/config consumed | Artifacts, PR comments, logs | Secrets or tokens required |

## Registered Agents

| Agent | Role | Trigger | Inputs | Outputs | Secrets |
|-------|------|---------|--------|---------|---------|
| `codex-cli` | Developer assistant for repo edits and reviews | Manual invocation via Codex CLI | Repo files, configs, docs | Code changes, doc updates, guidance | None |

## Governance

- Document ownership, escalation paths, and logging expectations per agent.
- Store credentials via GitHub Actions secrets or an approved vault—never in source.
- ADRs must capture any agent with material impact on security or deployment.
