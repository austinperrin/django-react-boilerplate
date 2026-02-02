# RBAC Matrix

This matrix captures target roles and permission concepts planned for the system.

| Role            | Description                               | Example Permissions                                      |
|-----------------|-------------------------------------------|----------------------------------------------------------|
| tenant-admin    | Full control over tenant configuration    | Manage entry points, configure IAM, view audit logs      |
| support         | Assist users without accessing sensitive data | View user status, reset passwords, manage tickets    |
| standard-user   | Default role for typical application users | View personal data, submit forms, receive notifications |
| custom-<slug>   | Tenant-defined role                       | Determined by tenant configuration                       |

## Permission Concepts

- Permissions should describe actions (e.g., `entry_point.view_reports`, `identity.manage_users`).
- Roles map to permission sets; tenants can extend both roles and permissions via configuration while retaining defaults.
- Document new roles/permissions in this matrix when introduced; ensure backend and frontend share the same definitions via `packages/rbac`.

## Implementation Notes

- Store role/permission definitions centrally (database + shared package).
- Provide migration scripts to seed default roles for new tenants.
- Expose admin APIs/UI for tenants to assign roles to users while respecting guardrails.
