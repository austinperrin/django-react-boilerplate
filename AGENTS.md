# Automation & Agent Manifest

Catalog of automated agents or AI helpers operating in this repo. Update whenever introducing or retiring agents.

## Template

| Agent | Role | Trigger | Inputs | Outputs | Secrets |
|-------|------|---------|--------|---------|---------|
| `agent-name` | Short description | e.g., GitHub Action workflow dispatch | Files/config consumed | Artifacts, PR comments, logs | Secrets or tokens required |

## Registered Agents

_None yet._

## Governance

- Document ownership, escalation paths, and logging expectations per agent.
- Store credentials via GitHub Actions secrets or an approved vault—never in source.
- ADRs must capture any agent with material impact on security or deployment.
