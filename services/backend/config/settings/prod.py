# ======================================================================
# PRODUCTION SETTINGS
# Hardened configuration for deployed environments. All sensitive values
# should be provided via environment variables.
# ======================================================================

from datetime import timedelta

from .base import *  # noqa: F403

# ----------------------------------------------------------------------
# SECURITY AND DEBUG
# ----------------------------------------------------------------------
DEBUG = False

# Expected to be set explicitly in the environment (comma-separated list).
ALLOWED_HOSTS = env.list("DJANGO_ALLOWED_HOSTS", default=[])

# Enforce HTTPS in production when behind a reverse proxy.
SECURE_SSL_REDIRECT = env.bool("DJANGO_SECURE_SSL_REDIRECT", default=True)
SECURE_PROXY_SSL_HEADER = ("HTTP_X_FORWARDED_PROTO", "https")

# Cookie security for highly sensitive data.
SESSION_COOKIE_SECURE = True
CSRF_COOKIE_SECURE = True
SESSION_COOKIE_SAMESITE = "Lax"
CSRF_COOKIE_SAMESITE = "Lax"

# Additional HTTP security headers.
SECURE_BROWSER_XSS_FILTER = True
SECURE_CONTENT_TYPE_NOSNIFF = True

# HSTS settings (enable when serving strictly over HTTPS).
SECURE_HSTS_SECONDS = env.int("DJANGO_SECURE_HSTS_SECONDS", default=0)
SECURE_HSTS_INCLUDE_SUBDOMAINS = env.bool(
    "DJANGO_SECURE_HSTS_INCLUDE_SUBDOMAINS", default=False
)
SECURE_HSTS_PRELOAD = env.bool("DJANGO_SECURE_HSTS_PRELOAD", default=False)

# ----------------------------------------------------------------------
# DJANGO REST FRAMEWORK (production defaults)
# ----------------------------------------------------------------------
REST_FRAMEWORK.setdefault("DEFAULT_AUTHENTICATION_CLASSES", [])
REST_FRAMEWORK["DEFAULT_AUTHENTICATION_CLASSES"].append(
    "rest_framework_simplejwt.authentication.JWTAuthentication"
)

REST_FRAMEWORK.setdefault("DEFAULT_PERMISSION_CLASSES", [])
REST_FRAMEWORK["DEFAULT_PERMISSION_CLASSES"].append(
    "rest_framework.permissions.IsAuthenticated",
)

# ----------------------------------------------------------------------
# SIMPLE JWT (production lifetimes)
# ----------------------------------------------------------------------
SIMPLE_JWT = {
    "ACCESS_TOKEN_LIFETIME": timedelta(minutes=5),
    "REFRESH_TOKEN_LIFETIME": timedelta(days=1),
    "ROTATE_REFRESH_TOKENS": True,
    "BLACKLIST_AFTER_ROTATION": True,
    "AUTH_HEADER_TYPES": ("Bearer",),
}

# ----------------------------------------------------------------------
# CORS (production)
# ----------------------------------------------------------------------
# In many deployments, frontend and backend are served from the same
# domain and CORS is not required. If you deploy them on different
# domains, use a strict allow-list here.
#
# CORS_ALLOWED_ORIGINS = env.list("DJANGO_CORS_ALLOWED_ORIGINS", default=[])
# CORS_ALLOW_CREDENTIALS = True

# ----------------------------------------------------------------------
# LOGGING
# ----------------------------------------------------------------------
# Basic production logging. Extend or forward to centralized logging
# as needed (for example, to stdout for containerized environments).
LOGGING = {
    "version": 1,
    "disable_existing_loggers": False,
    "handlers": {
        "console": {"class": "logging.StreamHandler"},
    },
    "root": {
        "handlers": ["console"],
        "level": "INFO",
    },
}
