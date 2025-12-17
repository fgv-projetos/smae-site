<template>
  <section class="contact-us">
    <h1>Fale conosco</h1>

    <div class="contact-us__container">
      <form
        v-if="!sent.status"
        class="max-section"
        method="get"
        @submit.prevent="handleSubmit"
      >
        <div class="form-group">
          <FieldInput name="name" label="nome" />

          <FieldInput name="email" label="E-mail" />
        </div>

        <div class="form-group">
          <FieldInput name="subject" label="Assunto" />
        </div>

        <div class="form-group">
          <FieldInput
            name="description"
            label="Descricao"
            type="textarea"
          />
        </div>

        <CtaButton
          label="Enviar"
          alternative
          type="submit"
          :loading="loading"
        />
      </form>

      <article v-else class="contact-us__sent-message">
        <p v-if="sent.error">
          Ops! Algo deu errado e não conseguimos enviar seu e-mail. <br>Tente de novo mais tarde.
        </p>

        <p v-else>
          Olá,
          sua mensagem foi enviada com sucesso. Nossa equipe irá analisá-la e retornaremos o contato em breve.
        </p>

        <small v-if="debug.length">
          Link para depuração:

          <ul>
            <li
              v-for="itemDebug in debug"
              :key="itemDebug.id"
            >
              <a

                :href="itemDebug.url"
                target="_blank"
              >{{ itemDebug.url }}</a>
            </li>
          </ul>
        </small>

        <CtaButton label="Voltar ao início" :to="{ name: 'index' }" />
      </article>
    </div>
  </section>
</template>

<script lang="ts" setup>
import CtaButton from '~/components/CtaButton.vue';
import FieldInput from '~/components/FieldInput.vue';

const loading = ref<boolean>(false)
const debug = ref<{ id: string, url: string | false }[]>([])
const sent = ref<{ status: boolean, error: boolean }>({
  status: false,
  error: false,
})

async function handleSubmit(ev: SubmitEvent) {
  if (!ev.target) {
    return
  }

  const formData = new FormData(ev.target)

  const data = {
    name: formData.get('name'),
    email: formData.get('email'),
    subject: formData.get('subject') || '',
    description: formData.get('description'),
  };

  try {
    loading.value = true

    const response = await $fetch(
      '/api/send-mail',
      {
        method: 'POST',
        body: data,
      },
    )

    if (response?.debug) {
      debug.value = response.debug
    }

    sent.value = {
      status: true,
      error: false,
    }
  } catch (e) {
    console.error(e)

    sent.value = {
      status: true,
      error: true,
    }
  } finally {
    loading.value = false
  }
};
</script>

<style lang="scss" scoped>
.contact-us {
  h1 {
    color: $primary-50;
    text-align: center;
    font-weight: 700;
    font-size: 1.25rem;
    line-height: 4.25rem;
  }
}

.form-group {
  width: 100%;
  display: flex;
  flex-direction: column;
  gap: 1.44rem;
  flex: 1;
}

.contact-us__container {
  background-color: $white;

  > * {
    display: flex;
    align-items: center;
    flex-direction: column;
    gap: 1.44rem;
    padding:  20px 25px 12px;
  }
}

.contact-us__sent-message {
  min-height: 55vh;

  p {
    font-size: 1.2rem;
    text-align: center;
  }

  small a {
    color: blue;
  }
}

@container (width > 1000px) {
  .contact-us {
    h1 {
      margin-top: 34px;
      font-size: 2.5rem;
    }
  }

  .contact-us__container {
    > * {
      padding: 50px 25px 70px;
    }
  }

  .form-group {
    flex-direction: row;
    gap: 3.13rem;
  }

  .contact-us__sent-message {
    min-height: 50vh;

    p {
      font-size: 1.75rem;
      max-width: 50vw;
      text-align: center;
    }
  }
}
</style>
