# ==========================================================
# DEVELOPMENT IMAGE (Placeholder)
# Provides a minimal dev environment until the backend
# scaffolding, requirements, and build steps are defined.
# ==========================================================
FROM python:3.11-slim AS dev

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=on

WORKDIR /app

# Install Python dependencies for development.
COPY requirements/base.txt requirements/base.txt
COPY requirements/dev.txt requirements/dev.txt
RUN pip install --upgrade pip setuptools wheel \
    && pip install -r requirements/dev.txt

COPY . /app

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]


# ==========================================================
# FUTURE BUILDER STAGE (Placeholder)
#
# This stage will install dependencies into a relocatable
# prefix to keep the runtime image minimal.
#
# FROM python:3.11-slim AS builder
# ==========================================================


# ==========================================================
# FUTURE PRODUCTION STAGE (Placeholder)
#
# This stage will run the application with a process manager
# (e.g., Gunicorn) and omit dev-only dependencies.
#
# FROM python:3.11-slim AS prod
# COPY --from=builder /install /usr/local
# ==========================================================
