#!/bin/sh
# Diagnostic script - run manually with: docker exec <container> /app/check-certs.sh

echo "=== Certificate Check ==="

CERT_PATH="/etc/nginx/ssl/cert.pem"
KEY_PATH="/etc/nginx/ssl/key.pem"

# Check if files exist
if [ ! -f "$CERT_PATH" ]; then
    echo "❌ MISSING: $CERT_PATH"
else
    echo "✓ Found: $CERT_PATH"
    openssl x509 -in "$CERT_PATH" -noout -subject -dates 2>/dev/null || echo "  ⚠ Invalid certificate"
fi

if [ ! -f "$KEY_PATH" ]; then
    echo "❌ MISSING: $KEY_PATH"
else
    echo "✓ Found: $KEY_PATH"
fi

# Check services
echo ""
echo "=== Service Status ==="
sv status nginx 2>/dev/null || echo "nginx: not managed by runit"
sv status nuxt 2>/dev/null || echo "nuxt: not managed by runit"

# Check if Node.js is listening
echo ""
echo "=== Ports ==="
netstat -tlnp 2>/dev/null | grep -E ':(80|443|3000)' || ss -tlnp | grep -E ':(80|443|3000)'