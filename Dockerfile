# Build stage
FROM node:20-alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .

# Use build (not generate) to include server-side API routes
RUN npm run build

# Verify build output exists
RUN ls -la .output/server/ && test -f .output/server/index.mjs

# Production stage with phusion/baseimage
FROM phusion/baseimage:noble-1.0.0

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

# Install Node.js 22 from NodeSource
RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates curl gnupg && \
    mkdir -p /etc/apt/keyrings && \
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg && \
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_22.x nodistro main" > /etc/apt/sources.list.d/nodesource.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends nginx nodejs && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Create directory for SSL certificates
RUN mkdir -p /etc/nginx/ssl

# Copy nginx config
COPY nginx.conf /etc/nginx/nginx.conf

# Copy built Nuxt application
COPY --from=builder /app/.output /app/.output

# Default environment variables (override via docker-compose or docker run -e)
ENV EMAIL_DRIVER=fgv
ENV EMAIL_HOST=smtpapp.fgv.br
ENV EMAIL_PORT=25
ENV EMAIL_USER=
ENV EMAIL_PASS=

# Setup runit service for Node.js (Nuxt server)
RUN mkdir -p /etc/service/nuxt
COPY scripts/run-nuxt.sh /etc/service/nuxt/run
RUN chmod +x /etc/service/nuxt/run

# Enable nginx runit service
RUN mkdir -p /etc/service/nginx
COPY scripts/run-nginx.sh /etc/service/nginx/run
RUN chmod +x /etc/service/nginx/run

# Copy diagnostic script (run manually: docker exec <container> /app/check-certs.sh)
COPY scripts/check-certs.sh /app/check-certs.sh
RUN chmod +x /app/check-certs.sh

# Expose ports
EXPOSE 80 443