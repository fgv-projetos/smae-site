#!/bin/sh

# Docker entrypoint script para verificar certificados SSL antes de iniciar o Nginx
# Este script aguarda até que certificados de produção válidos sejam adicionados ao projeto

set -e

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

CERT_PATH="/etc/nginx/ssl/cert.pem"
KEY_PATH="/etc/nginx/ssl/key.pem"
MAX_WAIT_TIME=${SSL_CERT_WAIT_TIMEOUT:-0}  # 0 = espera infinita por padrão
CHECK_INTERVAL=5
ENVIRONMENT=${ENVIRONMENT:-production}

echo -e "${BLUE}╔════════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║      SMAE - Sistema de Monitoramento Estratégico          ║${NC}"
echo -e "${BLUE}║              Docker Entrypoint - HTTPS                     ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════════════════╝${NC}"
echo ""
echo "Ambiente: ${ENVIRONMENT}"
echo ""

# Função para verificar se os certificados existem e são válidos
check_certificates() {
    if [ ! -f "$CERT_PATH" ]; then
        return 1
    fi

    if [ ! -f "$KEY_PATH" ]; then
        return 1
    fi

    # Verificar se os arquivos não estão vazios
    if [ ! -s "$CERT_PATH" ] || [ ! -s "$KEY_PATH" ]; then
        return 1
    fi

    # Verificar se o certificado é válido usando openssl
    if ! openssl x509 -in "$CERT_PATH" -noout -checkend 0 >/dev/null 2>&1; then
        echo -e "${RED}✗ Certificado encontrado mas está expirado!${NC}"
        return 1
    fi

    return 0
}

# Verificar se deve esperar pelos certificados
if [ "${SKIP_CERT_CHECK}" = "true" ]; then
    echo -e "${YELLOW}⚠ SKIP_CERT_CHECK está ativado. Pulando verificação de certificados.${NC}"
    echo -e "${YELLOW}⚠ ISSO É INSEGURO E NÃO DEVE SER USADO EM PRODUÇÃO!${NC}"
    echo ""
else
    echo "Verificando certificados SSL de produção..."
    echo "  Certificado: $CERT_PATH"
    echo "  Chave privada: $KEY_PATH"
    echo ""

    # Tentar encontrar os certificados
    elapsed=0
    found=false
    first_check=true

    while true; do
        if check_certificates; then
            found=true
            break
        fi

        if [ "$first_check" = true ]; then
            first_check=false
            echo -e "${YELLOW}⏳ Aguardando certificados SSL de produção...${NC}"
            echo ""
            echo "┌─────────────────────────────────────────────────────────┐"
            echo "│  Os certificados ainda não foram encontrados.          │"
            echo "│  O container está aguardando você adicionar os         │"
            echo "│  certificados de produção ao projeto.                  │"
            echo "└─────────────────────────────────────────────────────────┘"
            echo ""
            echo -e "${BLUE}Como adicionar certificados de produção:${NC}"
            echo ""
            echo "  1. Coloque seus certificados no diretório ./certs/"
            echo "     - Certificado: ./certs/cert.pem"
            echo "     - Chave privada: ./certs/key.pem"
            echo ""
            echo "  2. O container detectará automaticamente e iniciará"
            echo ""
            echo -e "${BLUE}Opções:${NC}"
            echo ""
            echo "  • Para certificados de desenvolvimento (auto-assinados):"
            echo "    ./scripts/generate-certs.sh"
            echo ""
            echo "  • Para produção com Let's Encrypt:"
            echo "    ./scripts/generate-letsencrypt.sh seu-dominio.com"
            echo ""
            echo "  • Para pular verificação (NÃO recomendado):"
            echo "    Adicione variável: SKIP_CERT_CHECK=true"
            echo ""

            if [ "$MAX_WAIT_TIME" -gt 0 ]; then
                echo -e "${YELLOW}Tempo limite: ${MAX_WAIT_TIME}s${NC}"
                echo ""
            else
                echo -e "${GREEN}Esperando indefinidamente... (CTRL+C para cancelar)${NC}"
                echo ""
            fi
        fi

        # Verificar timeout se configurado
        if [ "$MAX_WAIT_TIME" -gt 0 ] && [ "$elapsed" -ge "$MAX_WAIT_TIME" ]; then
            echo ""
            echo -e "${RED}╔════════════════════════════════════════════════════════════╗${NC}"
            echo -e "${RED}║  ERRO: Tempo limite excedido aguardando certificados!     ║${NC}"
            echo -e "${RED}╚════════════════════════════════════════════════════════════╝${NC}"
            echo ""
            echo "Por favor, adicione os certificados SSL e reinicie o container."
            echo ""
            exit 1
        fi

        printf "\r⏳ Aguardando certificados..."
        if [ "$MAX_WAIT_TIME" -gt 0 ]; then
            printf " %ds/%ds" "$elapsed" "$MAX_WAIT_TIME"
        else
            printf " %ds" "$elapsed"
        fi

        sleep $CHECK_INTERVAL
        elapsed=$((elapsed + CHECK_INTERVAL))
    done

    echo ""
    echo ""

    # Verificar informações do certificado
    echo -e "${GREEN}✓ Certificados SSL encontrados e válidos!${NC}"
    echo ""
    echo "┌─────────────────────────────────────────────────────────┐"
    echo "│  Informações do Certificado                            │"
    echo "└─────────────────────────────────────────────────────────┘"
    echo ""

    # Extrair informações do certificado
    SUBJECT=$(openssl x509 -in "$CERT_PATH" -noout -subject 2>/dev/null | sed 's/subject=/  /')
    ISSUER=$(openssl x509 -in "$CERT_PATH" -noout -issuer 2>/dev/null | sed 's/issuer=/  /')
    NOT_BEFORE=$(openssl x509 -in "$CERT_PATH" -noout -startdate 2>/dev/null | sed 's/notBefore=/  /')
    NOT_AFTER=$(openssl x509 -in "$CERT_PATH" -noout -enddate 2>/dev/null | sed 's/notAfter=/  /')

    # Verificar SAN (Subject Alternative Names)
    SAN=$(openssl x509 -in "$CERT_PATH" -noout -ext subjectAltName 2>/dev/null | grep -v "X509v3" | sed 's/^[ \t]*/  /')

    echo "Subject:"
    echo "$SUBJECT"
    echo ""
    echo "Issuer:"
    echo "$ISSUER"
    echo ""
    echo "Válido de:"
    echo "$NOT_BEFORE"
    echo ""
    echo "Válido até:"
    echo "$NOT_AFTER"

    if [ -n "$SAN" ]; then
        echo ""
        echo "Domínios válidos:"
        echo "$SAN"
    fi

    echo ""

    # Verificar se é certificado auto-assinado
    SUBJECT_CN=$(openssl x509 -in "$CERT_PATH" -noout -subject 2>/dev/null)
    ISSUER_CN=$(openssl x509 -in "$CERT_PATH" -noout -issuer 2>/dev/null)

    if [ "$SUBJECT_CN" = "$ISSUER_CN" ]; then
        echo -e "${YELLOW}╔════════════════════════════════════════════════════════════╗${NC}"
        echo -e "${YELLOW}║  ⚠  ATENÇÃO: Certificado AUTO-ASSINADO detectado!        ║${NC}"
        echo -e "${YELLOW}╚════════════════════════════════════════════════════════════╝${NC}"
        echo ""
        echo -e "${YELLOW}Este certificado é adequado apenas para DESENVOLVIMENTO.${NC}"
        echo -e "${YELLOW}Para produção, use certificados de uma CA confiável.${NC}"
        echo ""

        if [ "$ENVIRONMENT" = "production" ]; then
            echo -e "${RED}AVISO: Ambiente configurado como 'production' mas usando${NC}"
            echo -e "${RED}certificado auto-assinado. Isto NÃO é recomendado!${NC}"
            echo ""
        fi
    else
        echo -e "${GREEN}╔════════════════════════════════════════════════════════════╗${NC}"
        echo -e "${GREEN}║  ✓ Certificado emitido por CA confiável                   ║${NC}"
        echo -e "${GREEN}╚════════════════════════════════════════════════════════════╝${NC}"
        echo ""
    fi
fi

# Verificar e ajustar permissões dos certificados
if [ -f "$CERT_PATH" ] && [ -f "$KEY_PATH" ]; then
    echo "Ajustando permissões dos certificados..."
    chmod 644 "$CERT_PATH" 2>/dev/null || true
    chmod 600 "$KEY_PATH" 2>/dev/null || true
    echo ""
fi

echo -e "${GREEN}╔════════════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║              Iniciando Nginx com HTTPS                     ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════════════════════════╝${NC}"
echo ""

# Executar o Nginx
exec nginx -g "daemon off;"
