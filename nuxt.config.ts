// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  modules: ['@nuxt/eslint', '@nuxt/fonts', '@nuxt/eslint'],
  devtools: { enabled: true },
  compatibilityDate: '2025-07-15',
  eslint: {
    checker: true,
    config: {
      stylistic: true,
    },
  },
});
