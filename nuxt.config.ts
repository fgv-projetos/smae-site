// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  modules: ['@nuxt/eslint', '@nuxt/fonts', '@nuxt/eslint', '@vueuse/nuxt', '@nuxt/image', '@nuxt/icon'],
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
  compatibilityDate: '2025-07-15',
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
    provider: 'local',
    families: [
      {
        name: 'Ubuntu',
        preload: true,
        src: 'https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,900;1,900&display=swap',
      },
      {
        name: 'Roboto',
        preload: true,
        src: 'https://fonts.googleapis.com/css2?family=Roboto:wght@100..900&family=Ubuntu:wght@300;400;500;700&display=swap',
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
});
