<template>
  <label class="field-checkbox">
    <input
      v-model="selected"
      type="checkbox"
      :name="name"
    >

    <span class="field-checkbox__check-element">
      <Icon
        class="field-checkbox__check-element-icon"
        name="icon:check"
      />
    </span>

    <slot>{{ label }}</slot>
  </label>
</template>

<script lang="ts" setup>
type Props = {
  name: string
  label?: string
  modelValue?: boolean
}
type Emit = {
  (e: 'update:modelValue', value: boolean): void

}

const props = defineProps<Props>()
const emit = defineEmits<Emit>()

const selected = ref<boolean>(false)

watch(
  () => props.modelValue, () => {
    selected.value = props.modelValue
  },
  { immediate: true },
)

watch(
  selected, () => {
    emit(
      'update:modelValue', selected.value,
    )
  },
)
</script>

<style lang="scss" scoped>
.field-checkbox {
  display: flex;
  gap: 0.5em;
  align-items: center;

  color: $white;

  input {
    display: none;
  }
}

.field-checkbox__check-element {
  display: block;
  width: 18px;
  height: 18px;
  border-radius: 4px;
  border: 1.5px solid $primary-50;
  transition: background-color .1s ease-in;
  cursor: pointer;

  .field-checkbox__check-element-icon {
    display: block;
    opacity: 0;
    transition: opacity .1s ease-in;
  }
}

input:checked + .field-checkbox__check-element {
  background-color: $primary-50;

  .field-checkbox__check-element-icon {
    opacity: 1;
  }
}
</style>
