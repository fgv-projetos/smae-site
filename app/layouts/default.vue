<template>
  <div class="default-layout">
    <SiteHeader />

    <main>
      <slot />
    </main>
  </div>
</template>

<script lang="ts" setup>
import SiteHeader from '~/components/SiteHeader.vue';
</script>

<style>

</style>
