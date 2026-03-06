# Build cache
FROM node:22-bookworm-slim AS deps

WORKDIR /app

COPY package.json package-lock.json ./

RUN --mount=type=cache,target=/root/.npm \
    npm ci --ignore-scripts

# Application build
FROM deps AS builder

COPY tsconfig.json ./
COPY src ./src

RUN npm run build

# Application runtime
FROM gcr.io/distroless/nodejs24-debian12:nonroot AS runtime

# OCI spec compliant metadata
LABEL org.opencontainers.image.title="my-app" \
      org.opencontainers.image.description="Node.js TypeScript App" \
      org.opencontainers.image.authors="Patryk Osiak" \
      org.opencontainers.image.source="https://github.com/your-org/my-app"

WORKDIR /app

COPY --from=builder --chown=nonroot:nonroot /app/dist ./dist
COPY --from=deps    --chown=nonroot:nonroot /app/node_modules ./node_modules
COPY --chown=nonroot:nonroot package.json ./

USER nonroot

ENV NODE_ENV=production \
    PORT=3000

EXPOSE 3000

ENTRYPOINT ["/nodejs/bin/node"]
CMD ["dist/main.js"]
