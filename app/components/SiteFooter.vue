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
        <a>
          {{ link.label }}
        </a>
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
    link: '',
    external: false,
  },
  {
    label: 'Fale Conosco',
    link: '',
    external: false,
  },
  {
    label: 'Github',
    link: '',
    external: false,
  },
  {
    label: 'FGV Projetos',
    link: '',
    external: false,
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
  height: 2.69rem;
  gap: .43rem;

  hr {
    border-width: .5px;
    border-color: white;
    padding: 2px 0;
  }
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
  }

  .footer__link-item {
    font-size: .75rem;
    line-height: 1.1rem;
  }
}
</style>
