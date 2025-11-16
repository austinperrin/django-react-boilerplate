# ==========================================================
# BUILDER STAGE
# Responsible for installing Python dependencies into an
# isolated prefix. This stage includes build toolchains and
# header files required for compiling native extensions.
# ==========================================================
FROM python:3.13-slim AS builder

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=on

# Install build dependencies required by compiled Python packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    gcc \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Requirements files are copied separately to maximize Docker layer caching
# dev.txt is expected to include "-r base.txt".
COPY requirements/base.txt requirements/base.txt
COPY requirements/dev.txt requirements/dev.txt

# Upgrade packaging tools
RUN pip install --upgrade pip setuptools wheel

# Install all Python dependencies into a relocatable directory.
RUN pip install --prefix=/install -r requirements/dev.txt


# ==========================================================
# DEVELOPMENT RUNTIME STAGE
# Provides a minimal execution environment for local
# development. This stage excludes build tools and runs under
# a non-root user. Source code is copied for compatibility
# with both Docker Compose bind mounts and CI builds.
# ==========================================================
FROM python:3.13-slim AS dev

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=on

# Runtime dependencies only; excludes any build toolchains
RUN apt-get update && apt-get install -y --no-install-recommends \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Application user for non-root execution
RUN useradd --create-home --shell /bin/bash appuser

WORKDIR /app

# Copy dependency layer installed in the builder stage
COPY --from=builder /install /usr/local

# Copy project source code
COPY . .

# Ensure executable ownership is correct for the application user
RUN chown -R appuser:appuser /app
USER appuser

# Default command for local development. This may be overridden
# via docker-compose in order to run management commands or tests.
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]


# ==========================================================
# PRODUCTION RUNTIME STAGE (Placeholder)
#
# This stage will define a minimal production environment
# with the following characteristics:
#
#   - Uses the same builder output for dependency consistency
#   - Excludes development-only dependencies and debug tools
#   - Runs as a non-root user
#   - Uses a process manager such as Gunicorn
#   - Performs static asset collection
#   - Does not rely on bind mounts or file watchers
#
# The structure will resemble:
#
# FROM python:3.13-slim AS prod
# COPY --from=builder /install /usr/local
# COPY . .
# RUN useradd ...
# USER appuser
# CMD ["gunicorn", "config.wsgi:application"]
#
# ==========================================================
