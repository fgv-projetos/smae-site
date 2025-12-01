SDARQT-4904

# Nuxt Minimal Starter

Look at the [Nuxt documentation](https://nuxt.com/docs/getting-started/introduction) to learn more.

## Setup

Make sure to install dependencies:

```bash
# npm
npm install

# pnpm
pnpm install

# yarn
yarn install

# bun
bun install
```

## Development Server

Start the development server on `http://localhost:3000`:

```bash
# npm
npm run dev

# pnpm
pnpm dev

# yarn
yarn dev

# bun
bun run dev
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
