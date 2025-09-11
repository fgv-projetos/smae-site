<template>
  <section ref="modules" class="modules section">
    <div class="modules__container">
      <h1 ref="title" class="modules__title max-section">
        Módulos do SMAE
      </h1>

      <dl class="modules__list">
        <div
          v-for="(moduleItem, moduleItemIndex) in modules"
          :key="`module-item--${moduleItem.title}`"
          class="module-item"
          :style="{
            '--posicao': 1 + (2 * moduleItemIndex),
          }"
        >
          <Icon :name="'icon:'+moduleItem.icon" class="module-item__icon" />

          <div class="module-item__container">
            <dt class="module-item__title">
              {{ moduleItem.title }}
            </dt>

            <dd class="module-item__description">
              {{ moduleItem.description }}
            </dd>
          </div>
        </div>
      </dl>
    </div>
  </section>
</template>

<script lang="ts" setup>
import { useResizeObserver } from '@vueuse/core'

const modules = [
  {
    icon: 'modulo-programa-de-metas',
    title: 'Programa de Metas',
    description: 'O módulo de Programa de Metas é uma ferramenta estratégica projetada para realizar o acompanhamento das metas estabelecidas pela gestão pública e otimizar os resultados das políticas públicas através de indicadores e cronogramas em ciclos de monitoramento físico e financeiro.',
  },
  {
    icon: 'modulo-gestao-de-projetos',
    title: 'Gestão de Projetos',
    description: 'O módulo de Gestão de Projetos oferece transparência e eficiência no acompanhamento dos projetos públicos. Possibilita o monitoramento de prazos, custos, escopo e riscos, além de apoiar a tomada de decisões. Todo o processo é estruturado com base nas boas práticas do PMBOK, garantindo padronização, organização e maior controle na execução dos projetos.',
  },
  {
    icon: 'modulo-gestao-de-obras',
    title: 'Monitoramento de Obras',
    description: 'O módulo de Monitoramento de Obras foi criado para aprimorar a gestão e garantir maior eficiência no acompanhamento das obras realizadas pelos diferentes órgãos públicos. Ele promove sinergia entre as áreas envolvidas e integra as informações em uma única plataforma. Segue as boas práticas de monitoramento de obras públicas, permitindo o controle de prazos, custos, cronogramas, contratos e recursos, além de disponibilizar funcionalidades de georreferenciamento.',
  },
  {
    icon: 'modulo-transferencias-voluntarias',
    title: 'Transferências Voluntárias',
    description: 'O módulo de Transferências Voluntárias acompanha emendas parlamentares ao longo de todo o seu ciclo de vida, assegurando transparência sobre o andamento e a aplicação dos repasses. Representa um avanço significativo na gestão das transferências de recursos públicos, ao reunir expertise, tecnologia e processos para apoio aos órgãos na captação, execução e prestação de contas de recursos federais e estaduais.',
  },
  {
    icon: 'modulo-planos-setoriais',
    title: 'Planos Setoriais',
    description: 'O módulo de Planos Setoriais foi concebido para acompanhar os diferentes planos setoriais das secretarias, cujas ações se estendem ao longo de várias gestões. Os Planos Setoriais compartilham o mesmo banco de variáveis do Programa de Metas evitando a duplicidade de informação.',
  },
]

const titleTemplate = useTemplateRef('title')
const modulesTemplate = useTemplateRef('modules')

function getItemMargin() {
  if (!titleTemplate.value) {
    return '0'
  }

  const computedStyle = window.getComputedStyle(titleTemplate.value)

  return computedStyle.marginLeft
}

useResizeObserver(
  modulesTemplate, () => {
    if (import.meta.server) {
      return
    }

    const margin = getItemMargin()

    modulesTemplate.value?.style.setProperty(
      '--margin', margin,
    )
  },
)
</script>

<style lang="scss" scoped>
.modules {
  margin-bottom: 1rem;
}

.modules__title {
  color: $white;
  font-weight: 700;
  font-size: 1.56rem;
  line-height: 1;
  text-align: center;
  padding: 30px 0;
}

.modules__list {
  display: flex;
  flex-direction: column;
  gap: 16px;
}

$iconSize: 196px;

.module-item {
  padding: 60px 30px 60px 30px;
  background-color: $primary-50;
  position: relative;
  min-height: $iconSize;
}

.module-item:nth-of-type(even) {
  .module-item__icon {
    left: 0;
    right: initial;
  }
}

.module-item__container {
  margin-left: 16px;
}

.module-item__icon {
  position: absolute;

  right: 0;

  width: $iconSize;
  height: $iconSize;
  align-self: anchor-center;
}

.module-item__title {
  font-weight: 700;
  font-size: .68rem;
  line-height: 1;
}

.module-item__description {
  margin-top: .5rem;
  font-weight: 400;
  font-size: .62rem;
  line-height: .68rem;
}

@container (width > 900px) {
  .modules {
    margin-bottom: 11rem;
  }

  .modules__title {
    font-size: 2.5rem;
    text-align: left;
    padding-left: 2.5rem;
  }

  .modules__list {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    grid-template-rows: 100px;
    gap: 130px;
    gap: 0 100px;
  }

  .module-item {
    border-radius: 0 10px 10px 0;

    grid-column: 1;
    grid-row: var(--posicao) / span 3;

    padding-left: var(--margin);

    &:nth-of-type(even) {
      grid-column: 2;
      border-radius: 10px 0 0 10px;

      padding-left: initial;
      padding-right: var(--margin);
    }
  }

  .module-item__container {
    margin-left: 2.5rem;
  }

  .module-item__title {
    font-size: 1rem;
    line-height: 1;
  }

  .module-item__description {
    font-size: .87rem;
    line-height: 1rem;
  }
}
</style>
