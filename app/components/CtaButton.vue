<template>
  <component
    :is="to ? NuxtLink : 'button'"
    :to="to"
    :class="['cta-button', { 'cta-button--alternative': alternative }]"
    :target="isExternal ? '_blank' : undefined"
    @click="$emit('click')"
  >
    {{ label }}
  </component>
</template>

<script lang="ts" setup>
import type { RouteLocationRaw } from 'vue-router';

const NuxtLink = resolveComponent('NuxtLink');

type Emits = {
  click: () => void
}

type Props = {
  label: string
  to?: RouteLocationRaw | string
  alternative?: boolean
  type?: 'button' | 'submit'
}

const props = defineProps<Props>()
defineEmits<Emits>()

const isExternal = computed(() =>
  typeof props.to === 'string' && props.to.includes('://'))
</script>

<style lang="scss" scoped>
.cta-button {
  display: inline-block;
  padding: 13px 24px;
  background-color: $primary-50;
  color: $gray-800;
  border-radius: 50.02px;
  font-size: .75rem;
  line-height: 1.31rem;
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
