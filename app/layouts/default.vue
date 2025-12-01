<template>
  <div class="default-layout">
    <SiteHeader />

    <main>
      <slot />
    </main>

    <SiteFooter />
  </div>
</template>

<script lang="ts" setup>
</script>

<style lang="scss" scoped>
.default-layout {
  overflow: hidden;

  @container (width > 1000px) {
    overflow: initial;
  }

  main {
    padding-bottom: 6rem;
  }
}
</style>
