# ==========================================================
# DEVELOPMENT IMAGE (Placeholder)
# Provides a minimal dev environment until the frontend
# scaffolding, dependencies, and build steps are defined.
# ==========================================================
FROM node:20-alpine AS dev

ENV NODE_ENV=development

WORKDIR /app

# Copy dependency manifests first to maximize layer caching.
COPY package*.json . 2>/dev/null || true

# TODO: replace with actual dependency install steps.
RUN npm install || true

COPY . .

CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0", "--port", "5173"]


# ==========================================================
# FUTURE BUILD STAGE (Placeholder)
#
# This stage will install dependencies and build static assets.
#
# FROM node:20-alpine AS build
# ==========================================================


# ==========================================================
# FUTURE PRODUCTION STAGE (Placeholder)
#
# This stage will serve the built assets with a minimal runtime
# such as nginx or a static file server.
#
# FROM nginx:alpine AS prod
# COPY --from=build /app/dist /usr/share/nginx/html
# ==========================================================
