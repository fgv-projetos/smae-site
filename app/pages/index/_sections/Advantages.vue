<template>
  <section class="advantages section">
    <div class="advantages__container max-section">
      <article class="advantages__about">
        <p>
          O SMAE é um software livre e de código aberto voltado à administração pública, que permite o Gerenciamento de Programas de Metas e Planos Setoriais, Monitoramento de Obras, Gestão de Projetos e Monitoramento das Emendas Parlamentares.
        </p>

        <p>
          O SMAE estabelece processos mais eficientes de avaliação de políticas públicas, fortalecendo a gestão com uma abordagem estratégica baseada em indicadores e resultados.
        </p>
      </article>

      <aside>
        <dl class="advantages__list">
          <div
            v-for="advantageItem in advantages"
            :key="`advantage-item--${advantageItem.icon}`"
            class="advantage-item"
          >
            <dt class="advantage-item__icon">
              <Icon :name="'icon:'+advantageItem.icon" />
            </dt>

            <dd class="advantage-item__label">
              {{ advantageItem.label }}
            </dd>
          </div>
        </dl>
      </aside>
    </div>
  </section>
</template>

<script lang="ts" setup>
const advantages = [
  {
    icon: 'painel-estrategico',
    label: 'Dashboards interativos auxiliam na tomada de decisão.',
  },
  {
    icon: 'relatorio',
    label: 'Relatórios e APIs disponibilizam os dados.',
  },
  {
    icon: 'oportunidades',
    label: 'Integrações com sistemas governamentais: SOF, SEI, TransfereGov.',
  },
  {
    icon: 'editar',
    label: 'Promove melhores práticas na gestão da informação e garante a consistência na coleta de dados.',
  },
  {
    icon: 'banco-variaveis',
    label: 'Banco de variáveis centralizado permite o compartilhamento de dados entre PdM e Planos setoriais evitando retrabalho e minimizando risco de erros.',
  },
  {
    icon: 'busca',
    label: 'Guia e assistência através de integração com plataforma Wiki.',
  },
]
</script>

<style lang="scss" scoped>
$overflow: 47px;

.advantages {
  background-color: $white;
  margin-bottom: $overflow;
}

.advantages__container {
  display: flex;
  flex-direction: column;
  gap: 7px;

  padding: 32px 24px 0 24px;
}

.advantages__about {
  margin: auto;

  p {
    margin-left: 40px;

    font-weight: 400;
    font-size: .75rem;
    line-height: 1;
    letter-spacing: 1px;

    &:first-of-type {
      margin-bottom: .75rem;
    }
  }
}

.advantages__list {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 20px 10px;
  margin-bottom: calc($overflow * -1);
}

.advantage-item {
  padding: 9px 17px;
  box-shadow: 0 10px 16px -8px rgba(0, 0, 0, 0.3);
  border-radius: 8px;
  background-color: $white;
  min-height: 7rem;
}

.advantage-item__icon {
  width: 2.3rem;
  height: 2.3rem;
  border-radius: 100%;
  background-color: $gray-800;
  margin: auto;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: .4rem;

  span {
    width: 100%;
    height: 100%;
  }
}

.advantage-item__label {
  font-weight: 400;
  font-size: .5rem;
  line-height: 1;
  margin-top: 1rem;
}

@container (width > 1000px) {
  $overflow: 100px;

  .advantages {
    margin-bottom: $overflow;
  }

  .advantages__container {
    flex-direction: row;
    justify-content: space-between;
    gap: 30px;
  }

  .advantages__about p {
    font-size: 1rem;
    line-height: 1.38rem;

    &:first-of-type {
      margin-bottom: initial;
    }
  }

  .advantages__list {
    display: grid;
    gap: 40px 22px;
    margin-top: calc($overflow * -1);
    margin-bottom: calc($overflow * -1);
  }

  .advantage-item {
    padding: 36px 28px;
    min-height: 235px;
  }

  .advantage-item__icon {
    width: 6.25rem;
    height: 6.25rem;
    padding: 1.2rem;
  }

  .advantage-item__label {
    font-size: .87rem;
    line-height: 1.13rem;
  }
}
</style>
