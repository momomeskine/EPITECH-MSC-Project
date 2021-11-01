<template>
  <button class="Button" :class="{ loading: loading }" :type="type" :disabled="disabled || loading">{{ title }}</button>
</template>

<script>
export default {
  name: 'Button',
  props: { title: String, type: String, disabled: Boolean, loading: Boolean },
  data() {
    return {}
  },
  methods: {},
}
</script>

<style lang="scss" scoped>
button {
  min-height: 2.5rem;
  display: inline-flex;
  flex-wrap: wrap;
  align-items: center;
  justify-content: center;
  flex-shrink: 0;
  padding-left: 1rem;
  padding-right: 1rem;
  transition-property: background-color, border-color, color, fill, stroke, opacity, box-shadow, transform;
  transition-duration: 0.2s;
  transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
  border-color: $--n;
  border-radius: $--r-btn;
  border-width: $--b-btn;
  font-size: 0.875rem;
  font-weight: 600;
  line-height: 1em;
  text-align: center;
  user-select: none;
  text-transform: $--btn-text-case;
  background-color: $--nc;
  color: $--n;
  animation: button-pop $--animation-btn ease-out;
  cursor: pointer;

  &:active:focus,
  &:active:hover {
    animation: none;
    transform: scale($--btn-focus-scale);
  }
  &:focus-visible,
  &:focus {
    outline: $--a solid medium;
  }
  &:hover {
    // background-color: $--n;
    color: $--nf;
    border-color: $--nf;
  }

  &[disabled] {
    pointer-events: none;
    background-color: $--n;
    color: $--nc;
    opacity: 0.5;
  }

  &.loading::before {
    height: 1rem;
    width: 1rem;
    content: '';
    border-radius: 9999px;
    border-width: 2px;
    margin-right: 0.5rem;
    animation: spin 2s linear infinite;
    border-color: transparent currentColor currentColor transparent;
  }
}

@keyframes button-pop {
  0% {
    transform: scale($--btn-focus-scale);
  }
  40% {
    transform: scale(1.02);
  }
  to {
    transform: scale(1);
  }
}

@keyframes spin {
  to {
    transform: rotate(1turn);
  }
}
</style>
