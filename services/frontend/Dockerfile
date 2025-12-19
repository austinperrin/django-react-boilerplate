# Placeholder Dockerfile for React/Vite frontend
FROM node:20-alpine
WORKDIR /app
COPY package*.json . 2>/dev/null || true
RUN npm install || true
COPY . .
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0", "--port", "5173"]
