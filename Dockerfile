# Build stage
FROM node:20-alpine AS builder

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm ci

# Copy source code
COPY . .

# Build the application
RUN npm run build

# Production stage
FROM nginx:alpine

# Install openssl for certificate validation
RUN apk add --no-cache openssl

# Copy .env.fgv and create .env
COPY .env.fgv /app/.env.fgv
RUN cp /app/.env.fgv /app/.env

# Copy custom nginx config
COPY nginx.conf /etc/nginx/nginx.conf

# Copy built files from builder stage
COPY --from=builder /app/.output/public /usr/share/nginx/html

# Copy entrypoint script
COPY scripts/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Create directory for SSL certificates
RUN mkdir -p /etc/nginx/ssl

# Expose ports 80 and 443
EXPOSE 80 443

# Use custom entrypoint
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
