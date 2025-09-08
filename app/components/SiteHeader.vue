<template>
  <header class="site-header">
    <div ref="header" class="site-header__container">
      <figure>
        <div class="site-header__logo">
          logo
        </div>
      </figure>

      <button
        v-if="isMobile"
        class="site-header__nav-button"
        @click="handleToggleMenu"
      >
        <img src="~/assets/icons/menu-hamburguer.svg" alt="">
      </button>

      <nav
        :class="[
          'site-header__items',
          { 'site-header__items--is-visible': isMenuVisible },
        ]"
      >
        <NuxtLink
          v-for="section in sections"
          :key="`section--${section.key}`"
          class="site-header__item"
          :to="`#${section.key}`"
          @click="handleHideMenu"
        >
          {{ section.label }}
        </NuxtLink>
      </nav>
    </div>
  </header>
</template>

<script lang="ts" setup>
import { useDebounceFn, useResizeObserver } from '@vueuse/core'

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

const headerTemplate = useTemplateRef('header')

const isMobile = ref(true)
const isMenuVisible = ref(true)

useResizeObserver(
  headerTemplate, useDebounceFn(
    async () => {
      if (!headerTemplate.value) {
        return
      }

      isMobile.value = !!(headerTemplate.value?.offsetWidth < 1000)
    }, 400,
  ),
);

watch(
  isMobile, () => {
    isMenuVisible.value = false
  },
)

function handleToggleMenu() {
  isMenuVisible.value = !isMenuVisible.value
}

function handleHideMenu() {
  isMenuVisible.value = false
}

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
.site-header {
  top: 0;
  width: 100%;
  z-index: 1000;
  box-shadow: 0px 2px 3px 0px #0000004D;
  background-color: $white;
  padding: 20px 25px;
  container-type: inline-size;
  position: relative;
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
  background-color: $white;
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
  /* height: 100%; */

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

@container (width < 1000px) {
  .site-header__nav-button {
    cursor: pointer;
    padding: 5px;
  }

  .site-header__items {
    position: absolute;
    top: 100%;
    height: 100vh;
    right: 0;
    gap: 0;

    flex-direction: column;
    padding: 30px 25px;

    transform: translateX(100%);
    transition: transform .3s ease-in;
  }

  .site-header__items--is-visible {
    transform: translateX(0);
  }

  .site-header__item {
    text-align: center;
  }
}
</style>
