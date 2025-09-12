<template>
  <Hero />

  <Advantages />

  <Modules />

  <About />

  <ContactUs />

  <StartToUse />

  <SiteFooter />
</template>

<script lang="ts" setup>
import SiteFooter from '~/components/SiteFooter.vue';
import About from './_sections/About.vue';
import Advantages from './_sections/Advantages.vue';
import ContactUs from './_sections/ContactUs.vue';
import Hero from './_sections/Hero.vue';
import Modules from './_sections/Modules.vue';
import StartToUse from './_sections/StartToUse.vue';
</script>

<style scoped>
p, h1 {
  margin: 0 auto;
  max-width: 900px;
}
</style>
