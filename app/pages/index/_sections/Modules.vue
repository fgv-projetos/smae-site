<template>
  <section class="modules section">
    <div class="modules__container max-section">
      <article class="modules__about">
        <p>
          O SMAE é um software livre e de código aberto voltado à administração pública, que permite o Gerenciamento de Programas de Metas e Planos Setoriais, Monitoramento de Obras, Gestão de Projetos e Monitoramento das Emendas Parlamentares.
        </p>

        <p>
          O SMAE estabelece processos mais eficientes de avaliação de políticas públicas, fortalecendo a gestão com uma abordagem estratégica baseada em indicadores e resultados.
        </p>
      </article>

      <aside>
        <dl class="modules__list">
          <div
            v-for="moduleItem in modules"
            :key="`module-item--${moduleItem.icon}`"
            class="module-item"
          >
            <dt class="module-item__icon">
              <Icon :name="'icon:'+moduleItem.icon" />
            </dt>

            <dd class="module-item__label">
              {{ moduleItem.label }}
            </dd>
          </div>
        </dl>
      </aside>
    </div>
  </section>
</template>

<script lang="ts" setup>
const modules = [
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
] as const
</script>

<style lang="scss" scoped>
.modules {
  background-color: $white;
}

.modules__container {
  display: flex;
  justify-content: space-between;
  gap: 30px;
}

.modules__about p {
  margin-left: 40px;

  font-weight: 400;
  font-size: .75rem;
  line-height: .75rem;
  letter-spacing: 1px;

  &:first-of-type {
    margin-bottom: .75rem;
  }
}
</style>
