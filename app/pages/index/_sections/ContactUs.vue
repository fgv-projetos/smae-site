<template>
  <section class="contact-us max-section">
    <article class="contact-us__content">
      <figure class="contact-us__logo">
        <NuxtImg
          src="logo-fgv.png"
          alt="FGV Logo"
          :size="150"
        />
      </figure>

      <aside>
        <div class="contact-us__description">
          <p>
            A FGV Projetos, especializada em desenvolver soluções e produtos para o setor público, destaca-se por sua contribuição para modernizar estratégias governamentais e fomentar a inovação por meio da transformação digital. Com foco na experiência do usuário, a FGV Projetos contribui para a formação de um ecossistema de tecnologias governamentais.
          </p>

          <p>
            A FGV Projetos oferece customização, desenvolvimento e treinamento para uma implantação de sucesso e máximo aproveitamento.
          </p>
        </div>

        <CtaButton label="Fale conosco" to="https://projetos.fgv.br/solicitar-proposta" />
      </aside>
    </article>

    <figure class="contact-us__maps">
      <NuxtImg
        class="map-item-main"
        src="maps/map-main.png"
      />

      <NuxtImg class="map-item" src="maps/map-2.jpg" />

      <NuxtImg class="map-item" src="maps/map-3.png" />

      <NuxtImg class="map-item" src="maps/map-4.png" />
    </figure>
  </section>
</template>

<script setup lang="ts">
import CtaButton from '~/components/CtaButton.vue';
</script>

<style lang="scss" scoped>
.contact-us {
  padding-top: 1.75rem;
  padding-bottom: 2rem;
}

.contact-us__logo {
  min-width: 124px;

}

.contact-us__content {
  display: flex;
  gap: .75rem;
}

.contact-us__description {
  color: $white;
  font-weight: 400;
  font-size: .75rem;
  line-height: 1.1rem;

  p {
    margin-bottom: 1rem;
  }
}

.contact-us__maps {
  margin-top: 1.88rem;
  position: relative;
  width: 100%;
  display: block
}

.map-item-main {
  width: 80%;
  height: 100%;

  border-radius: 5px;
}

.map-item:nth-of-type(2) {
  position: absolute;
  top: -3%;
  right: 0;
  width: 35%;
  height: 29%;
  border-radius: 5px;
}

.map-item:nth-of-type(3) {
  position: absolute;
  top: 76%;
  right: 0;

  width: 47%;
  height: 42%;
  border-radius: 5px;
}

.map-item:nth-of-type(4) {
  position: absolute;
  top: 93%;
  left: 0;

  width: 45%;
  height: 42%;
  border-radius: 5px;
}
</style>
