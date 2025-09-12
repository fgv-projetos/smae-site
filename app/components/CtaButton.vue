<template>
  <NuxtLink
    :to="to"
    :class="['cta-button', { 'cta-button--alternative': alternative }]"
    :target="isExternal ? '_blank' : undefined"
  >{{ label }}</NuxtLink>
</template>

<script lang="ts" setup>
import type { RouteLocationRaw } from 'vue-router';

type Props = {
  label: string
  to: RouteLocationRaw | string
  alternative?: boolean
}

const props = defineProps<Props>()

const isExternal = computed(() =>
  typeof props.to === 'string' && props.to.includes('://'))
</script>

<style lang="scss" scoped>
.cta-button {
  display: inline-block;
  padding: 6px 12px;
  background-color: $primary-50;
  color: $gray-800;
  border-radius: 50.02px;
  font-size: .43rem;
  line-height: .8rem;
  text-transform: uppercase;
  font-family: Roboto;
  font-weight: 900;
  letter-spacing: 1px;
  cursor: pointer;

  @container (width > 1000px) {
    padding: 12px 24px;
    font-size: .75rem;
    line-height: 1.3rem;
  }
}

.cta-button--alternative {
  background-color: $gray-800;
  color: $primary-50;
}
</style>
