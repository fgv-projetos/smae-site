# Build stage
FROM node:20-alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .

# Use build (not generate) to include server-side API routes
RUN npm run build

# Production stage with phusion/baseimage
FROM phusion/baseimage:noble-1.0.0

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

# Install nginx and nodejs
RUN apt-get update && \
    apt-get install -y --no-install-recommends nginx nodejs npm && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Create directory for SSL certificates
RUN mkdir -p /etc/nginx/ssl

# Copy nginx config
COPY nginx.conf /etc/nginx/nginx.conf

# Copy built Nuxt application
COPY --from=builder /app/.output /app/.output

# Copy .env for runtime
COPY .env.fgv /app/.env

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

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*