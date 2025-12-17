// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  modules: ['@nuxt/eslint', '@nuxt/fonts', '@nuxt/eslint', '@vueuse/nuxt', '@nuxt/image', '@nuxt/icon'],
  ssr: true,
  devtools: { enabled: true },
  app: {
    head: {
      title: 'SMAE - Sistema de Monitoramento e Acompanhamento Estratégico',
      meta: [
        {
          name: 'description',
          content: 'SMAE - Sistema de Monitoramento e Acompanhamento Estratégico',
        },
      ],
      htmlAttrs: {
        lang: 'pt-BR',
        dir: 'ltr',
      },
      // titleTemplate: 'SMAE | ',
      link: [
        {
          rel: 'manifest',
          href: '/site.webmanifest',
        },

        {
          rel: 'icon',
          href: '/favicon-96x96.png',
          type: 'image/png',
          sizes: '96x96',
        },
        {
          rel: 'icon',
          href: '/favicon.svg',
          type: 'image/svg+xml',
        },
        {
          rel: 'shortcut icon',
          href: '/favicon.ico',
        },
        {
          rel: 'apple-touch-icon',
          sizes: '180x180',
          href: '/apple-touch-icon.png',
        },
        {
          rel: 'manifest',
          href: '/site.webmanifest',
        },
      ],
    },
  },
  css: ['~/assets/scss/main.scss'],

  // Runtime config - use NUXT_ prefix env vars at runtime
  // NUXT_EMAIL_DRIVER, NUXT_EMAIL_HOST, etc. will override these defaults
  runtimeConfig: {
    email: {
      driver: 'ethereal',  // Override with NUXT_EMAIL_DRIVER
      host: '',            // Override with NUXT_EMAIL_HOST
      port: 25,            // Override with NUXT_EMAIL_PORT
      user: '',            // Override with NUXT_EMAIL_USER
      pass: '',            // Override with NUXT_EMAIL_PASS
    },
  },

  devServer: {
    https: {
      key: './certs/localhost-key.pem',
      cert: './certs/localhost.pem',
    },
  },
  compatibilityDate: '2025-07-15',

  nitro: {
    preset: 'node-server',
    prerender: {
      crawlLinks: true,
      routes: ['/'],
    },
  },
  // nitro: {
  //   routeRules: {
  //     '**': { cache: false }, // Disable caching for this route
  //   },
  // },
  vite: {
    css: {
      preprocessorOptions: {
        scss: {
          additionalData: `
            @use "@/assets/scss/global.scss" as *;
          `,
        },
      },
    },
  },
  eslint: {
    checker: true,
    config: {
      stylistic: true,
    },
  },
  fonts: {
    families: [
      {
        name: 'Ubuntu',
        provider: 'google',
        preload: true,
        weight: '300...700',
        styles: ['normal'],
        subsets: ['latin'],
        display: 'swap',
      },
      {
        name: 'Roboto',
        provider: 'google',
        preload: true,
        weight: [700, 900],
        styles: ['normal'],
        subsets: ['latin'],
        display: 'swap',
      },
    ],
  },
  icon: {
    customCollections: [
      {
        prefix: 'icon',
        dir: './app/assets/icons',
      },
    ],
  },
  image: {
    dir: 'assets/images', // specify your images directory within assets/
    // force ipx, as otherwise it would default to using Netlify Image CDN (which probably is better to use, but issue is about ipx)
    provider: 'ipx',
    domains: ['smae-site.netlify.app'],
  },
})