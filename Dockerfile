# Build the static website with a pinned Node.js Alpine image.
FROM node:22-alpine AS builder
# Set the working directory for the build stage.
WORKDIR /app
# Copy dependency manifests first to improve Docker layer caching.
COPY package*.json ./
# Install exactly the dependencies recorded in package-lock.json.
RUN npm ci
# Copy the website pages and shared styles into the build stage.
COPY src/ ./src/
COPY styles/ ./styles/
# Build every HTML entry page into the dist directory.
RUN npm run build

# Serve only the generated static files from a pinned Nginx Alpine image.
FROM nginx:1.27-alpine
# Copy the compiled website from the builder stage into Nginx's web root.
COPY --from=builder /app/dist /usr/share/nginx/html
# Document the HTTP port used by Nginx.
EXPOSE 80
# Keep Nginx in the foreground so the container stays running.
CMD ["nginx", "-g", "daemon off;"]
