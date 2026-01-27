# Threat Model

## Objectives

- Identify key assets (tenant data, credentials, infrastructure) and the threats targeting them.
- Document mitigations and residual risks to inform security controls and testing.

## Assets & Entry Points

- **Tenant Data**: stored in Postgres; accessed via backend APIs.
- **Authentication Credentials**: passwords, SSO tokens, MFA secrets.
- **Portal Interfaces**: web/mobile clients per user type.
- **Infrastructure**: Docker hosts, load balancers, secret stores.

## Threats (STRIDE)

- **Spoofing**: attackers impersonate users or tenants via credential stuffing or SSO misconfigurations.
- **Tampering**: injection attacks against APIs, unauthorized modification of tenant settings.
- **Repudiation**: lack of audit trails for admin actions.
- **Information Disclosure**: data leaks through misconfigured RBAC or insecure storage.
- **Denial of Service**: resource exhaustion against entry points or APIs.
- **Elevation of Privilege**: exploiting backend bugs to gain admin access.

## Mitigations

- Strong MFA, rate limiting, IP allowlists for privileged roles.
- Input validation, DRF throttling, WAF rules for APIs.
- Centralized auditing with immutable logs (future SIEM integration).
- Encrypted storage (database + backups) with strict RBAC.
- Auto-scaling and circuit breakers to absorb DoS attempts.
- Continuous security testing (SAST/DAST) and dependency scanning.

## Residual Risks & Open Items

- SSO misconfiguration risk when tenants self-manage IdP settings – mitigation: guided onboarding and validation tests.
- Insider threats require strict logging and periodic access reviews.
- Need concrete performance baselines to detect DoS anomalies.

Revisit this document each release cycle or when major architectural changes occur.
