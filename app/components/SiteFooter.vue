<template>
  <footer class="footer max-section">
    <div class="footer__content">
      <NuxtImg class="footer__logo-smae" src="smae-logo.png" />

      <hr>

      <NuxtImg class="footer__logo-fgv" src="logo-fgv.png" />
    </div>

    <ul class="footer__links">
      <li
        v-for="(link, linkIndex) in links"
        :key="`link-item--${linkIndex}`"
        class="footer__link-item"
      >
        <NuxtLink
          :to="link.link"
          :target="link.external ? '_blank' : undefined"
        >
          {{ link.label }}
        </NuxtLink>
      </li>
    </ul>
  </footer>
</template>

<script lang="ts" setup>
const links = [
  {
    label: 'Política de Privacidade',
    link: '',
    external: false,
  },
  {
    label: 'Termos de Uso',
    link: { hash: '#diretriz-de-uso' },
    external: false,
  },
  {
    label: 'Fale Conosco',
    link: { hash: '#fale-conosco' },
    external: false,
  },
  {
    label: 'Código Fonte',
    link: { hash: '#diretriz-de-uso' },
    external: false,
  },
  {
    label: 'FGV Projetos',
    link: 'https://projetos.fgv.br/',
    external: true,
  },
]
</script>

<style lang="scss" scoped>
.footer {
  display: flex;
  align-items: flex-end;
  justify-content: space-between;
  padding-top: 42px;
  padding-bottom: 36px;
}

.footer__content {
  display: flex;
  flex-direction: column;
  max-width: 7.5rem;
  gap: .43rem;

  hr {
    border-width: 0;
    border-bottom-width: 1px;
    border-color: white;
    padding: 2px 0;
  }
}

.footer__logo-smae {
  width: 5.65rem;
  margin: auto;
}

.footer__links {
  display: flex;
  flex-direction: column;
  gap: 1.31rem;
}

.footer__link-item {
  text-align: end;
  font-weight: 700;
  font-size: .62rem;
  line-height: 1.1rem;

  a {
    color: $white;
    position: relative;

    &::after {
      content: '';
      position: absolute;
      top: 100%;
      left: 0;
      width: 100%;
      height: 1px;
      background-color: currentColor;
      border-radius: 5px;
    }
  }
}

@container (width > 1000px) {
  .footer {
    margin-top: 7.88rem;
    padding-bottom: 6rem;
  }

  .footer__content {
    height: 7.56rem;
    flex-direction: row;
    align-items: center;

    hr {
      height: 100%;
      border-right-width: 1px;
    }
  }

  .footer__logo-smae {
    width: 17.75rem;
    max-width: initial;
  }

  .footer__logo-fgv {
    max-width: 18.75rem;
    height: 50px;
  }

  .footer__link-item {
    font-size: .75rem;
    line-height: 1.1rem;
  }
}
</style>
