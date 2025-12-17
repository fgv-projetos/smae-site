<script setup lang="ts">
import FieldCheckbox from '~/components/FieldCheckbox.vue';

const acceptTerms = ref<boolean>(false)

async function handleAccessSourceCode(ev: SubmitEvent) {
  if (!ev.target || !acceptTerms.value) {
    return
  }

  const formData = new FormData(ev.target)

  const data = {
    name: formData.get('name'),
    email: formData.get('email'),
    acceptTerms: true,
  };

  await $fetch(
    '/api/access-source-code',
    {
      method: 'POST',
      body: data,
    },
  )

  window.open(
    'https://github.com/fgv-projetos/smae', '_blank',
  )
}
</script>

<template>
  <section class="start-to-use">
    <article class="article article--guideline">
      <div class="article__container max-section">
        <h2>
          Diretriz para uso
        </h2>

        <p>
          O SMAE foi desenvolvido utilizando tecnologias opensource e é licenciado através das licenças públicas GNU Affero General Public License (Licença Pública Geral GNU Affero) - AGPL versão 3.
        </p>

        <p>
          Você está livre para baixar o código, desenvolver novas funcionalidades e implantar o SMAE desde que cumpra todos os termos dessa licença.
        </p>

        <p>
          O nome SMAE e a indicação de que o código original  é de autoria da FGV Projetos devem ser preservados e quaisquer alterações, adaptações ou manutenções posteriores realizadas por terceiros não são de responsabilidade da FGV Projetos.
        </p>

        <p>
          Conheça os termos antes de baixar os fontes clicando no link abaixo.
        </p>

        <CtaButton
          label="Leia mais"
          alternative
          to="https://github.com/fgv-projetos/smae/blob/master/LICENSE"
        />

        <aside class="article-technologies max-section">
          <div class="article-technologies__container">
            <NuxtImg
              v-for="technologie in ['docker', 'vue', 'nest', 'postgres', 'metabase', 'minio']"
              :key="`technologie--${technologie}`"
              :src="`technologies/${technologie}.png`"
              :alt="`technologie: ${technologie}`"
              :title="`technologie: ${technologie}`"
            />
          </div>
        </aside>
      </div>
    </article>

    <article class="article article--start">
      <div class="article__container max-section">
        <h2>Comece a usar!</h2>

        <p>
          Por ser um software livre e de código aberto o SMAE é ideal para utilização em diversas entidades públicas. Pode ser adaptado por outras entidades para seu próprio planejamento estratégico, garantindo transparência, colaboração e evolução contínua.
        </p>

        <p>
          Consulte a diretriz de uso.
        </p>

        <p>
          Para acessar o código fonte, preencha os dados abaixo.
        </p>

        <form
          method="get"
          class="start-to-use__form"
          @submit.prevent="handleAccessSourceCode"
        >
          <FieldInput
            name="name"
            label="Nome"
            placeholder="Nome"
          />

          <FieldInput
            name="email"
            label="Email"
            placeholder="Email"
          />

          <FieldCheckbox
            v-model="acceptTerms"
            name="accept-terms"
            label="Eu aceito que meu email seja usado para contato futuro"
          />

          <CtaButton
            type="submit"
            label="Acessar código fonte"
            :disabled="!acceptTerms"
          />
        </form>
      </div>
    </article>
  </section>
</template>

<style lang="scss" scoped>
.start-to-use {
  margin-top: 33px;
}

.article {
  h2 {
    color: $gray-800;
    margin-bottom: .5rem;
    font-weight: 700;
    font-size: .81rem;
    line-height: 1;
  }

  p {
    font-weight: 400;
    margin-bottom: .87rem;
    line-height: .87rem;
    font-size: .75rem;
  }
}

.article__container {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
}

.article--guideline {
  position: relative;
  padding-top: 25px;
  padding-bottom: 66px;
  background-color: $white;
  margin-bottom: 32px;
}

.article--start {
  h2 {
    color: $primary-50;
  }
}

.article-technologies {
  position: absolute;
  bottom: 0;
  left: 0;
  transform: translateY(50%);
  width: 100%;
}

.article-technologies__container {
  display: flex;
  justify-content: space-around;
  gap: .81rem;
  background-color: $white;
  border-radius: 0 0 20px 20px;
  padding: 1rem .68rem;

  img {
    width: 40px;
    height: 45px;
  }
}

.article--start {
  padding-top: 32px;
  margin-bottom: 47px;

  p {
    color: $white;
  }
}

@container (width > 1000px) {
  .start-to-use {
    background-color: initial;
    display: flex;
    gap: 5.25rem;
    justify-content: space-between;

    @include max-section;
  }

  .article {
    padding-top: initial;
    padding-bottom: initial;
    margin-bottom: initial;

    h2 {
      font-size: 1rem;
      line-height: 1.1rem;
    }

    p {
      font-size: .87rem;
      line-height: 1.1rem;
    }
  }

  .article__container {
    padding-top: 4rem;
    padding-bottom: 4rem;
  }

  .article--guideline {
    position: relative;
    background-color: $white;
    border-radius: 0 20px 20px 0;

    &::before {
      content: '';
      position: absolute;
      width: 100vw;
      height: 100%;
      background-color: $white;
      right: 99%;
      z-index: -1;
    }

    .article__container {
      padding-right: 3.13rem;
    }
  }

  .article-technologies {
    position: absolute;
    top: 0;
    left: initial;
    right: 0;

    transform: translateX(50%);
    width: initial;

    align-self: center;
  }

  .article-technologies__container {
    flex-direction: column;
    justify-content: space-around;
    background-color: $white;
    border-radius: 0 20px 20px 0;

    img {
      width: 58px;
      height: 58px;
    }
  }
}

.start-to-use__form {
  width: 100%;
  display: flex;
  flex-direction: column;
  gap: 1rem;
}
</style>
