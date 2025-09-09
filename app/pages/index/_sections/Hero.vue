<template>
  <section class="hero section">
    <div class="hero__container max-section">
      <NuxtImg
        class="hero__logo"
        src="logo-large.png"
        alt="Smae Logo - Grande"
        width="280"
        height="110"
      />

      <NuxtImg
        class="hero__fgv-logo"
        src="logo-fgv.png"
        alt="FGV Logo"
        :size="150"
      />

      <h1 class="hero__title">
        Sistema de Monitoramento e Acompanhamento Estratégico
      </h1>

      <CtaButton class="hero__cta" label="Comece a usar" />
    </div>
  </section>
</template>

<script lang="ts" setup></script>

<style lang="scss" scoped>
.hero {
  min-height: 257px;

  /* Fallback for browsers that don't support image-set() or -webkit-image-set() */
  background-image: url('~/assets/images/hero.png');

  background-image:
    -webkit-image-set(url('~/assets/images/hero.png') 1x,
    url('~/assets/images/hero@2x.png') 2x);

  background-size: 280% 115%;
  background-repeat: no-repeat;
  background-position: center center;

  color: #fff;
}

.hero__container {
  position: relative;

  display: flex;
  flex-direction: column;
  align-items: center;

  padding-top: 42px;
}

.hero__logo {
  width: 140px;
  height: 56px;
}

.hero__title {
  margin-top: 20px;

  font-size: 1rem;
  line-height: 1.25rem;
  font-weight: 400;
  max-width: 13.75rem;
}

.hero__cta {
  margin-top: 20px;
}

.hero__fgv-logo {
  display: none;
}

@container (width > 1000px) {
  .hero {
    min-height: 562px;
    background-size: cover;
  }

  .hero__logo {
    width: 270px;
    height: 110px;
  }

  .hero__title {
    margin-top: 10px;

    font-size: 2.25rem;
    line-height: 4.25rem;
    font-weight: 400;
    max-width: initial;
  }

  .hero__cta {
    margin-top: 23px;
  }

  .hero__fgv-logo {
    position: absolute;
    top: 0;
    right: 0;
    width: 150px;
    height: 150px;
  }
}
</style>
