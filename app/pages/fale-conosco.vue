<template>
  <section class="contact-us">
    <h1>Fale conosco</h1>

    <div class="contact-us__container">
      <form
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
        />
      </form>
    </div>
  </section>
</template>

<script lang="ts" setup>
import CtaButton from '~/components/CtaButton.vue';
import FieldInput from '~/components/FieldInput.vue';

// const { $mail } = useNuxtApp();
// const mail = useMail()

function handleSubmit(ev: SubmitEvent) {
  if (!ev.target) {
    return
  }

  const formData = new FormData(ev.target)

  const data = {
    name: formData.get('name'),
    email: formData.get('email'),
    subject: formData.get('subject'),
    description: formData.get('description'),
  }

  // const a = {} as

  // mail.send({
  //   from: 'John Doe',
  //   subject: 'Incredible',
  //   text: 'This is an incredible test message',
  // });
}

// onMounted(() => {
//   $mail.send({
//     from: 'sender@example.com',
//     to: 'recipient@example.com',
//     subject: 'Test message',
//     text: 'I hope this message gets delivered!',
//   })
// })
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

  form {
    display: flex;
    align-items: center;
    flex-direction: column;
    gap: 1.44rem;
    padding:  20px 25px 12px;
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
}

@container (width > 1000px) {
  .contact-us {
    h1 {
      margin-top: 34px;
      font-size: 2.5rem;
    }

    form {
      padding: 50px 25px 70px;
    }
  }

  .form-group {
    flex-direction: row;
    gap: 3.13rem;
  }
}
</style>
