import type { RouterConfig } from '@nuxt/schema'

export default <RouterConfig>{
  scrollBehavior(to, from, savedPosition) {
    if (import.meta.server) {
      return
    }
    // If a savedPosition exists (e.g., from browser back/forward), use it
    if (savedPosition) {
      return savedPosition
    }
    // If a hash is present in the target route, scroll to that element
    if (to.hash) {
      return {
        el: to.hash,
        top: 0,
        behavior: 'smooth',
      }
    }
    // Otherwise, scroll to the top of the page
    return {
      top: 0,
      left: 0,
      behavior: 'smooth',
    }
  },
}
