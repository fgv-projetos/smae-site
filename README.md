SDARQT-4904

# SMAE - Sistema de Monitoramento e Acompanhamento Estratégico

Sistema desenvolvido com Nuxt 3 para monitoramento e acompanhamento estratégico.

## Setup

Instale as dependências:

```bash
npm install
```

## Configuração HTTPS

### Desenvolvimento Local

Para executar o servidor de desenvolvimento com HTTPS:

1. Gere os certificados SSL auto-assinados:

```bash
./scripts/generate-certs.sh
```

2. Inicie o servidor de desenvolvimento:

```bash
npm run dev
```

O servidor estará disponível em `https://localhost:3000`

**Nota:** Seu navegador mostrará um aviso de segurança pois o certificado é auto-assinado. Isso é normal para desenvolvimento. Clique em "Avançado" e prossiga.

### Desenvolvimento com Docker

Para executar em desenvolvimento com HTTPS usando Docker:

1. Gere os certificados SSL auto-assinados:

```bash
./scripts/generate-certs.sh
```

2. Construa e execute com Docker Compose:

```bash
docker-compose up -d
```

O site estará disponível em:
- `https://localhost` (HTTPS - porta 443)
- `http://localhost` (HTTP - porta 80, redireciona para HTTPS)

**Nota:** O container aguardará até 60 segundos pelos certificados. Se não encontrar, mostrará instruções.

3. Para parar os containers:

```bash
docker-compose down
```

### Produção com Docker

Para executar em **produção** com certificados válidos:

#### Opção 1: Usando Let's Encrypt (Recomendado)

1. Execute o script automático para obter certificados Let's Encrypt:

```bash
./scripts/generate-letsencrypt.sh seu-dominio.com
```

Este script irá:
- Instalar o certbot (se necessário)
- Obter certificados válidos do Let's Encrypt
- Copiar automaticamente para `./certs/`
- Configurar permissões corretas

2. Inicie o container de produção:

```bash
docker-compose -f docker-compose.prod.yml up -d
```

#### Opção 2: Adicionar Certificados Manualmente

Se você já possui certificados de uma CA válida:

1. Copie seus certificados para o diretório `./certs/`:

```bash
cp seu-certificado.crt ./certs/cert.pem
cp sua-chave-privada.key ./certs/key.pem
chmod 644 ./certs/cert.pem
chmod 600 ./certs/key.pem
```

2. Inicie o container:

```bash
docker-compose -f docker-compose.prod.yml up -d
```

**IMPORTANTE:** O container aguardará **indefinidamente** pelos certificados de produção. Ele só iniciará quando detectar certificados válidos em `./certs/`.

#### Monitorar logs do container:

```bash
# Ver se o container está aguardando certificados
docker logs smae-site-prod -f

# Ver logs do Nginx
docker exec smae-site-prod tail -f /var/log/nginx/access.log
docker exec smae-site-prod tail -f /var/log/nginx/error.log
```

#### Parar o container de produção:

```bash
docker-compose -f docker-compose.prod.yml down
```

### Estrutura de Certificados

Os certificados devem estar no diretório `./certs/`:

```
certs/
├── localhost.pem       # Certificado para Nuxt dev
├── localhost-key.pem   # Chave privada para Nuxt dev
├── cert.pem           # Certificado para Nginx
└── key.pem            # Chave privada para Nginx
```

### Variáveis de Ambiente

O sistema suporta as seguintes variáveis de ambiente para configuração de SSL:

| Variável | Padrão | Descrição |
|----------|--------|-----------|
| `ENVIRONMENT` | `production` | Ambiente de execução (`development` ou `production`) |
| `SSL_CERT_WAIT_TIMEOUT` | `0` | Tempo em segundos para aguardar certificados (0 = infinito) |
| `SKIP_CERT_CHECK` | `false` | Pular verificação de certificados (NÃO recomendado) |

**Exemplo:**

```bash
# Aguardar 300 segundos (5 minutos) por certificados
docker-compose -f docker-compose.prod.yml up -d -e SSL_CERT_WAIT_TIMEOUT=300
```

### Comportamento do Container

O container possui um sistema inteligente de espera por certificados:

1. **Ao iniciar**, verifica se os certificados existem em `/etc/nginx/ssl/`
2. **Se não encontrar**, aguarda pelos certificados e mostra instruções no log
3. **Valida** se os certificados são válidos e não estão expirados
4. **Detecta** se é certificado auto-assinado e emite avisos apropriados
5. **Só inicia o Nginx** quando certificados válidos são detectados

**Como funciona a espera:**

```bash
# Em desenvolvimento: aguarda 60 segundos
docker-compose up -d

# Em produção: aguarda indefinidamente
docker-compose -f docker-compose.prod.yml up -d

# Você pode adicionar certificados DEPOIS de iniciar o container
# O container detectará automaticamente e iniciará
```

## Development Server

Start the development server on `https://localhost:3000`:

```bash
npm run dev
```

## How to Deploy

Build the application for production:

```bash
# Fill .env variables
FGV_EMAIL_DRIVER='fgv'
FGV_EMAIL_HOST=''
FGV_EMAIL_PORT=''
FGV_EMAIL_USER=''
```

```bash
# Run
npm run build
```

```bash
execute file:
.output/server/index.mjs
```

Docs: https://nuxt.com/docs/3.x/getting-started/deployment
