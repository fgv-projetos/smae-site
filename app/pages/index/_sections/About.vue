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
        <figure>
          <NuxtImg />
        </figure>
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
  margin-top: .75rem;
  width: 100%;
  height: 150px;
  background-color: rgba(255, 0, 0, 0.251);
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
    /* width: 60%; */
    height: 330px;
  }
}
</style>
