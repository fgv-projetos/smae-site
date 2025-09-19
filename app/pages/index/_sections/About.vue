<template>
  <section class="about" @mouseenter.once="handleFocus">
    <div class="about__conteiner max-section">
      <article class="about__content">
        <h1 class="about__title">
          História de Sucesso:<br>
          Prefeitura Municipal de São Paulo
        </h1>

        <p class="about__description">
          A Prefeitura de São Paulo deu um importante passo rumo à modernização e eficiência em sua gestão com o Sistema de Monitoramento e Acompanhamento Estratégico (SMAE).O SMAE é fruto de uma parceria técnica iniciada em 2022, desenvolvido com base em metodologias ágeis e alinhado às demandas da administração municipal. A ferramenta possibilita o acompanhamento estruturado das ações estratégicas da Prefeitura, oferecendo suporte à tomada de decisão com base em dados, indicadores e evidências.Por meio da publicação do Decreto Municipal Nº 63.336 de 10 de abril de 2024 o SMAE se tornou a ferramenta oficial do monitoramento do Programa de Metas (PdM) da cidade.
        </p>
      </article>

      <aside class="about__figure">
        <NuxtImg
          class="about__device-frame"
          src="device-frame.png"
          alt="Estrutura de smarthphone"
        />

        <iframe
          :src="`https://drive.google.com/file/d/1r7Z72joD5TmWqUP53YVeeXjYVCaoXpgn/preview?autoplay=${autoplay}`"
          frameborder="0"
          class="about__video"
        />
      </aside>
    </div>
  </section>
</template>

<script lang="ts" setup>
const autoplay = ref(0)

function handleFocus() {
  autoplay.value = 1
}
</script>

<style lang="scss" scoped>
.about {
  background-color: $white;
  padding: 1.88rem;
}

.about__content {
  padding: 0 1rem;
}

.about__title {
  color: $gray-800;
  font-weight: 700;
  font-size: .81rem;
  line-height: 1rem;
}

.about__description {
  margin-top: .5rem;
  font-size: .75rem;
  line-height: 1rem;
}

.about__figure {
  margin: 0 auto;

  margin-top: .75rem;
  max-width: 314px;
  width: 100%;
  height: 186px;

  position: relative;

  display: flex;
  justify-content: center;
  align-items: center;
}

.about__device-frame {
  position: absolute;
  left: 0;
  width: 100%;
  height: 100%;
  transform: rotate(180deg);
}

.about__video {
  position: absolute;
  z-index: 100;
  background-color: #000;

  max-width: 296px;
  width: 100%;
  height: 161px;
  border-radius: 13px;
}

@container (width > 1000px) {
  .about {
    padding: 5.94rem;
  }

  .about__conteiner {
    display: flex;
    justify-content: space-between;
  }

  .about__content {
    padding: 0 2.5rem;
    width: 60%;
    margin: auto;
  }

  .about__title {
    font-size: 1rem;
    line-height: 1.38rem;
  }

  .about__description {
    font-size: .87rem;
    line-height: 1rem;
  }

  .about__figure {
    flex-basis: 100%;

    min-width: 470px;
    max-width: 470px;
    height: 330px;
  }

  .about__video {
    max-width: 443px;
    height: 285px;
    border-radius: 20px;
  }
}

@container (width > 1200px) {
  .about__figure {
    flex-basis: 100%;

    min-width: 635px;
    max-width: 635px;
    height: 330px;
  }

  .about__video {
    max-width: 600px;
    height: 285px;
    border-radius: 23px;
  }
}
</style>
