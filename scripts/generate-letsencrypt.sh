#!/bin/bash

# Script para obter certificados Let's Encrypt para produção

set -e

# Cores para output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Verificar se o domínio foi fornecido
if [ -z "$1" ]; then
    echo -e "${RED}Erro: Domínio não fornecido${NC}"
    echo ""
    echo "Uso: $0 <dominio>"
    echo ""
    echo "Exemplo:"
    echo "  $0 smae.exemplo.com"
    echo ""
    exit 1
fi

DOMAIN=$1

echo -e "${BLUE}╔════════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║      SMAE - Geração de Certificados Let's Encrypt         ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════════════════╝${NC}"
echo ""
echo "Domínio: $DOMAIN"
echo ""

# Verificar se certbot está instalado
if ! command -v certbot &> /dev/null; then
    echo -e "${YELLOW}Certbot não encontrado. Instalando...${NC}"
    echo ""

    # Detectar sistema operacional
    if [ -f /etc/debian_version ]; then
        echo "Detectado: Debian/Ubuntu"
        sudo apt-get update
        sudo apt-get install -y certbot
    elif [ -f /etc/redhat-release ]; then
        echo "Detectado: RedHat/CentOS"
        sudo yum install -y certbot
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        echo "Detectado: macOS"
        if ! command -v brew &> /dev/null; then
            echo -e "${RED}Erro: Homebrew não encontrado. Instale em https://brew.sh${NC}"
            exit 1
        fi
        brew install certbot
    else
        echo -e "${RED}Sistema operacional não suportado automaticamente.${NC}"
        echo "Por favor, instale o certbot manualmente:"
        echo "  https://certbot.eff.org/instructions"
        exit 1
    fi
    echo ""
fi

echo -e "${GREEN}✓ Certbot encontrado${NC}"
echo ""

# Criar diretório certs se não existir
mkdir -p certs

echo -e "${YELLOW}Obtendo certificado Let's Encrypt...${NC}"
echo ""
echo "IMPORTANTE:"
echo "  1. Seu domínio deve estar apontando para este servidor"
echo "  2. As portas 80 e 443 devem estar acessíveis"
echo "  3. Certifique-se de que nenhum serviço está rodando nessas portas"
echo ""

read -p "Pressione ENTER para continuar ou CTRL+C para cancelar..."
echo ""

# Obter certificado usando standalone mode
echo "Obtendo certificado..."
sudo certbot certonly \
    --standalone \
    --preferred-challenges http \
    --agree-tos \
    --no-eff-email \
    --email admin@${DOMAIN} \
    -d ${DOMAIN}

echo ""

# Verificar se os certificados foram criados
if [ ! -f "/etc/letsencrypt/live/${DOMAIN}/fullchain.pem" ]; then
    echo -e "${RED}Erro: Certificados não foram gerados!${NC}"
    exit 1
fi

echo -e "${GREEN}✓ Certificados obtidos com sucesso!${NC}"
echo ""

# Copiar certificados para o diretório do projeto
echo "Copiando certificados para ./certs/..."
sudo cp /etc/letsencrypt/live/${DOMAIN}/fullchain.pem ./certs/cert.pem
sudo cp /etc/letsencrypt/live/${DOMAIN}/privkey.pem ./certs/key.pem

# Ajustar permissões
sudo chown $USER:$USER ./certs/*.pem
chmod 644 ./certs/cert.pem
chmod 600 ./certs/key.pem

echo -e "${GREEN}✓ Certificados copiados!${NC}"
echo ""

# Exibir informações do certificado
echo "┌─────────────────────────────────────────────────────────┐"
echo "│  Informações do Certificado                            │"
echo "└─────────────────────────────────────────────────────────┘"
echo ""

openssl x509 -in ./certs/cert.pem -noout -text | grep -E "Subject:|Issuer:|Not Before|Not After|DNS:" | sed 's/^/  /'

echo ""
echo -e "${GREEN}╔════════════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║              Certificados configurados!                    ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════════════════════════╝${NC}"
echo ""
echo "Próximos passos:"
echo ""
echo "  1. Inicie o container Docker:"
echo "     docker-compose up -d"
echo ""
echo "  2. Acesse seu site em:"
echo "     https://${DOMAIN}"
echo ""
echo -e "${YELLOW}RENOVAÇÃO AUTOMÁTICA:${NC}"
echo ""
echo "  Let's Encrypt emite certificados válidos por 90 dias."
echo "  Configure renovação automática com cron:"
echo ""
echo "  sudo crontab -e"
echo ""
echo "  Adicione a linha:"
echo "  0 0 * * * certbot renew --quiet --deploy-hook './scripts/copy-renewed-certs.sh'"
echo ""
