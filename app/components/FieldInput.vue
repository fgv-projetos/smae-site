<template>
  <label class="field-input">
    <span class="field-input__label">{{ label }}</span>

    <component
      :is="type === 'textarea' ? 'textarea' : 'input'"
      :id="name"
      class="field-input__input"
      :name="name"
      :type="type"
      required
    /></label>
</template>

<script lang="ts" setup>
type Props = {
  label: string
  name: string
  type?: 'text' | 'textarea'
  placeholder?: string
}

withDefaults(
  defineProps<Props>(),
  {
    type: 'text',
  },
)
</script>

<style lang="scss" scoped>
.field-input {
  display: flex;
  flex-direction: column;
  gap: .5rem;

  width: 100%;
}

.field-input__label {
  font-family: Roboto;
  font-weight: 700;
  font-style: Bold;
  font-size: .75rem;
  line-height: 120%;
  text-transform: uppercase;
  color: $gray-600;
}

.field-input__input {
  background-color: $white;
  border: 1.5px solid #E3E5E8;
  border-radius: 4px;
  padding: 12px 16px;
  outline: none;
  resize: none;
}
</style>
