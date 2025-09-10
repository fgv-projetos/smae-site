// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  modules: ['@nuxt/eslint', '@nuxt/fonts', '@nuxt/eslint', '@vueuse/nuxt', '@nuxt/image', '@nuxt/icon'],
  devtools: { enabled: true },
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
