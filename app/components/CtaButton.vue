<template>
  <component
    :is="to ? NuxtLink : 'button'"
    :to="to"
    :class="[
      'cta-button',
      { 'cta-button--alternative': alternative },
      { 'cta-button--loading': loading },
      { 'cta-button--disabled': disabled },
    ]"
    :target="isExternal ? '_blank' : undefined"
    :aria-disabled="loading || disabled"
    @click="$emit('click')"
  >
    <Icon
      v-if="loading"
      name="icon:loading"
      size="18"
      class="cta-button__icon"
    />

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
  loading?: boolean
  type?: 'button' | 'submit'
  disabled?: boolean
}

const props = defineProps<Props>()
defineEmits<Emits>()

const isExternal = computed(() =>
  typeof props.to === 'string' && props.to.includes('://'))
</script>

<style lang="scss" scoped>
.cta-button {
  display: inline-flex;
  justify-content: center;
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
  gap: 8px;

  transition: all .2s ease-in;

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

.cta-button--loading {
  opacity: 0.7;
  cursor: wait;
}

.cta-button--disabled {
  background-color: $gray-50;
  color: $gray-300;
  cursor: initial;
}

@keyframes rotate {
  from{
    transform: rotate(0deg);
  }

  to{
    transform: rotate(360deg);
  }
}

.cta-button__icon {
  animation: rotate 2s linear infinite;
}
</style>
