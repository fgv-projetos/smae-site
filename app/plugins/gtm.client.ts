export default defineNuxtPlugin(() => {
  const gtmId = 'GTM-W2QWQ2JT'

  // Add GTM script to head
  useHead({
    script: [
      {
        innerHTML: `(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','${gtmId}');`,
        tagPosition: 'head',
      },
    ],
    noscript: [
      {
        innerHTML: `<iframe src="https://www.googletagmanager.com/ns.html?id=${gtmId}" height="0" width="0" style="display:none;visibility:hidden"></iframe>`,
        tagPosition: 'bodyOpen',
      },
    ],
  })

  // Provide GTM tracking method
  return {
    provide: {
      gtm: {
        push: (event: Record<string, unknown>) => {
          if (typeof window !== 'undefined') {
            const w = window as typeof window & { dataLayer?: unknown[] }
            if (w.dataLayer) {
              w.dataLayer.push(event)
            }
          }
        },
      },
    },
  }
})
