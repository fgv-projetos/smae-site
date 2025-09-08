<template>
  <header class="site-header">
    <div class="site-header__container">
      <figure>
        <div class="site-header__logo">
          logo
        </div>
      </figure>

      <nav class="site-header__items">
        <NuxtLink
          v-for="section in sections"
          :key="`section--${section.key}`"
          class="site-header__item"
          :to="`#${section.key}`"
        >
          {{ section.label }}
        </NuxtLink>
      </nav>
    </div>
  </header>
</template>

<script lang="ts" setup>
const sections: { label: string, key: string }[] = [
  {
    label: 'Funcionalidades',
    key: 'funcionalidades',
  },
  {
    label: 'Módulos',
    key: 'modulos',
  },
  {
    label: 'História de Sucesso',
    key: 'historia-de-sucesso',
  },
  {
    label: 'fale conosco',
    key: 'fale-conosco',
  },
  {
    label: 'Guia para uso',
    key: 'guia-para-uso',
  },
  {
    label: 'comece a usar',
    key: 'comece-a-usar',
  },
]

onMounted(() => {
  window.addEventListener(
    'scroll', function () {
      const header = document.querySelector('.header');
      if (window.scrollY > 100) {
        header.style.background = 'rgba(30, 58, 95, 0.95)';
        header.style.backdropFilter = 'blur(10px)';
      }
      else {
        header.style.background = 'var(--primary-blue)';
        header.style.backdropFilter = 'none';
      }
    },
  );
})
</script>

<style lang="scss" scoped>
  /* .header {
    background: $primary-blue;
    padding: 1rem 0;
    position: fixed;
    } */

.site-header {
  top: 0;
  width: 100%;
  z-index: 1000;
  box-shadow: 0px 2px 3px 0px #0000004D;
  background-color: $white;
  padding: 20px 80px;
  container-type: inline-size;
}

.site-header__container {
  max-width: 1300px;
  margin: 0 auto;

  display: flex;
  justify-content: space-between;
  align-items: center;
}

.site-header__logo {
  width: 110px;
  height: 42px;
  background-color: red;
}

.site-header__items {
  display: flex;
  gap: 30px;
}

.site-header__item {
  padding: 10px 0;
  font-family: Roboto;
  font-weight: 900;
  font-size: .75rem;
  line-height: 1.3rem;
  letter-spacing: 0.1rem;
  text-transform: uppercase;
  color: $gray-600;
  height: 100%;

  position: relative;

  &:after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 0;

    width: 100%;
    height: 4px;
    background-color: $gray-600;
    border-radius: 30px;

    transform: scaleX(0);
    transform-origin: center;
    transition: transform 0.5s ease;
  }

  &:hover::after {
    transform: scaleX(1);
  }

}

.header-content {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.logo {
  height: 40px;
  filter: brightness(0) invert(1);
}

.nav-menu {
  display: flex;
  list-style: none;
  gap: 2rem;
}

.nav-menu a {
  color: white;
  text-decoration: none;
  font-size: 0.9rem;
  transition: color 0.3s;
}

.nav-menu a:hover {
  color: var(--accent-yellow);
}
</style>
