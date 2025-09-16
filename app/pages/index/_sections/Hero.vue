<template>
  <section class="hero section">
    <div class="hero__container max-section">
      <div class="hero__content">
        <NuxtImg
          class="hero__fgv-logo"
          src="logo-fgv.png"
          alt="FGV Logo"
        />

        <NuxtImg
          class="hero__logo"
          src="logo-large.png"
          alt="Smae Logo - Grande"
          width="280"
          height="110"
        />

        <h1 class="hero__title">
          Sistema de Monitoramento e Acompanhamento Estratégico
        </h1>

        <CtaButton
          class="hero__cta"
          label="Comece a usar"
          :to="{ hash: '#diretriz-de-uso' }"
        />
      </div>
    </div>
  </section>
</template>

<script lang="ts" setup></script>

<style lang="scss" scoped>
.hero {
  display: flex;
  min-height: 18rem;

  /* Fallback for browsers that don't support image-set() or -webkit-image-set() */
  background-image: url('~/assets/images/hero.png');

  background-image:
    -webkit-image-set(url('~/assets/images/hero.png') 1x,
    url('~/assets/images/hero@2x.png') 2x);

  background-size: 280% 115%;
  background-repeat: no-repeat;
  background-position: center center;

  color: $white;
}

.hero__container {
  flex: 1;
  padding-bottom: 2.38rem;
  padding-top: .81rem;
}

.hero__content {
  position: relative;

  flex: 1;
  height: 100%;

  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: flex-end;
}

.hero__logo {
  width: 8.75rem;
  height: 3.5rem;
}

.hero__title {
  margin-top: 1.25rem;

  font-size: 1rem;
  line-height: 1.25rem;
  font-weight: 400;
  max-width: 13.75rem;
}

.hero__cta {
  margin-top: 1.25rem;
}

.hero__fgv-logo {
  position: absolute;
  top: 0;
  left: 0;
  width: 6.88rem;
}

@container (width > 1000px) {
  .hero {
    min-height: 31.25rem;
    background-size: cover;
  }

  .hero__container {
    padding-top: 2rem;
    padding-bottom: 4.38rem;
  }

  .hero__content {
    padding-bottom: 5.75rem;
  }

  .hero__logo {
    width: 16.88rem;
    height: 6.88rem;
  }

  .hero__fgv-logo {
    top: 0;
    left: initial;
    right: 0;
    width: 13.75rem;
  }

  .hero__title {
    margin-top: .62rem;

    font-size: 2.25rem;
    line-height: 4.25rem;
    font-weight: 400;
    max-width: initial;
  }

  .hero__cta {
    margin-top: 1.44rem;
  }
}
</style>
