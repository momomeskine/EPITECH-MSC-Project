<template>
  <div>
    <span v-for="icon in iconsFas" :key="icon" style="padding: 3px">
      {{ icon }}
      <font-awesome-icon :icon="['fas', icon]" size="2x" />
    </span>
    <hr />
    <span v-for="icon in iconsFar" :key="icon" style="padding: 3px">
      {{ icon }}
      <font-awesome-icon :icon="['far', icon]" size="2x" />
    </span>
    <hr />
    <span v-for="icon in iconsFab" :key="icon" style="padding: 3px">
      {{ icon }}
      <font-awesome-icon :icon="['fab', icon]" size="2x" />
    </span>
  </div>
</template>

<script>
import { library } from '@fortawesome/fontawesome-svg-core'

export default {
  name: 'IconTest',
  data() {
    return {
      iconsFas: Object.keys(library.definitions.fas || {}),
      iconsFar: Object.keys(library.definitions.far || {}),
      iconsFab: Object.keys(library.definitions.fab || {}),
    }
  },
}
</script>

<style scoped>
hr {
  padding: 0.5rem 0;
}
</style>
