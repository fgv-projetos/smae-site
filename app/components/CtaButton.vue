<template>
  <a
    href="#contato"
    class="cta-button"
  >{{ label }}</a>
</template>

<script lang="ts" setup>
type Props = {
  label: string
}

defineProps<Props>()
</script>

<style lang="scss" scoped>
.cta-button {
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

  @container (width > 1000px) {
    padding: 12px 24px;
    font-size: .75rem;
    line-height: 1.3rem;
  }
}
</style>
