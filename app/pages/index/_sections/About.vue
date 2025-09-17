<template>
  <section class="about">
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
        <video class="about__video" controls>
          <!-- <source src="~/assets/videos/SMAE-PT BR- S LEG 1.mp4" type="video/mp4"> -->
        </video>
      </aside>
    </div>
  </section>
</template>

<style lang="scss" scoped>
.about {
  background-color: $white;
  padding: 1.88rem;
}

.about__content {
  padding: 0 1rem;
}

.about__title {
  color: $primary-50;
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
  max-width: 400px;

  margin-top: .75rem;
  width: 100%;
  height: 100%;

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
  width: 100%;
  height: 160px;
  background-color: #000;
  margin: 13px 8px;
  border-radius: 15px;
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

    height: 330px;
    min-width: 530px;
    max-width: 700px;
  }

  .about__video {
    width: 100%;
    height: 285px;
    margin: 0 15px;
    border-radius: 25px;
  }
}
</style>
