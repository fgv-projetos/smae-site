#!/bin/bash

# Script para gerar certificados SSL auto-assinados para desenvolvimento
# Este script cria certificados tanto para desenvolvimento local (Nuxt) quanto para produção (Docker/Nginx)

set -e

# Cores para output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Gerando certificados SSL auto-assinados...${NC}"

# Criar diretório certs se não existir
mkdir -p certs

# Gerar certificado para desenvolvimento local (Nuxt)
echo -e "${GREEN}1. Gerando certificados para desenvolvimento local (Nuxt)...${NC}"
openssl req -x509 -newkey rsa:4096 -sha256 -days 365 -nodes \
  -keyout certs/localhost-key.pem \
  -out certs/localhost.pem \
  -subj "/CN=localhost" \
  -addext "subjectAltName=DNS:localhost,DNS:*.localhost,IP:127.0.0.1"

# Gerar certificado para Docker/Nginx (mesmo certificado, nomes diferentes)
echo -e "${GREEN}2. Copiando certificados para uso com Docker/Nginx...${NC}"
cp certs/localhost-key.pem certs/key.pem
cp certs/localhost.pem certs/cert.pem

echo -e "${GREEN}✓ Certificados gerados com sucesso!${NC}"
echo ""
echo "Certificados criados em ./certs/:"
echo "  - localhost.pem / cert.pem (certificado)"
echo "  - localhost-key.pem / key.pem (chave privada)"
echo ""
echo -e "${YELLOW}IMPORTANTE:${NC}"
echo "Estes são certificados auto-assinados para DESENVOLVIMENTO apenas."
echo "Seu navegador irá mostrar um aviso de segurança - isso é normal."
echo ""
echo "Para uso em produção, use certificados de uma CA confiável como Let's Encrypt."
