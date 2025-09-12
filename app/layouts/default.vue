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
import SiteFooter from '~/components/SiteFooter.vue';
import SiteHeader from '~/components/SiteHeader.vue';
</script>

<style>

</style>
