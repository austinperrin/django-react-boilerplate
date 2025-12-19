# Security Checklist Template

Use this checklist during pre-release reviews or tenant onboarding.

- [ ] Review ADRs for recent security-impacting decisions.
- [ ] Confirm RBAC roles/permissions match tenant requirements.
- [ ] Ensure secrets are stored in the approved secret manager; no plaintext configs.
- [ ] Validate TLS certificates and cipher suites.
- [ ] Run dependency scans (pip-audit, npm audit, Trivy) and address critical findings.
- [ ] Verify logging coverage (auth events, admin actions, data exports).
- [ ] Check backup status and recovery test dates.
- [ ] Update documentation (security baseline, IAM configs) with any changes.

Customize per tenant or compliance framework as needed.
