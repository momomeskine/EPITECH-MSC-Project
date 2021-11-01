<template>
  <div class="Input">
    <label v-if="title">
      <span class="label-text">{{ title }}</span>
    </label>
    <slot />
    <label v-if="error">
      <!--<a href="#" class="label-text-alt">Forgot username?</a>-->
      <span href="#" class="label-text-alt">{{ error }}</span>
    </label>
  </div>
</template>

<script>
export default {
  name: 'Input',
  props: { title: String, type: String, name: String, value: String, placeholder: String, error: String },
  data() {
    return {}
  },
  methods: {},
}
</script>

<style lang="scss" scoped>
label {
  display: flex;
  align-items: center;
  justify-content: space-between;
  user-select: none;
  padding: 0.25rem 0.25rem;
}

.label-text,
.label-text-alt {
  color: $--bc;
}

.label-text {
  font-size: 0.9rem;
  line-height: 1.25rem;
}

.label-text-alt {
  padding: 0.25rem 0;
  font-size: 1rem;
  line-height: 1rem;
  font-style: italic;
  color: $--er;
}

a {
  color: inherit;
  text-decoration: inherit;
}

input {
  height: 2.5rem;
  width: 100%;
  padding-left: 1rem;
  padding-right: 1rem;
  transition-property: background-color, border-color, color, fill, stroke, opacity, box-shadow, transform;
  transition-duration: 0.2s;
  transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
  font-size: 0.875rem;
  line-height: 2;
  background-color: $--b1;
  border-color: $--bc;
  border-width: 1px;
  border-radius: $--r-btn;

  &:focus-visible {
    outline: $--a solid medium;
  }
}

input::placeholder,
textarea::placeholder {
  color: #a1a1aa;
}
</style>
