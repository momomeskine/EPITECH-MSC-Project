<template>
  <div id="app">
    <component :is="layout">
      <router-view />
    </component>
  </div>
</template>

<script>
const DEFAULT_LAYOUT = 'Default'
// import { apiServer } from '@/api/server.api.js'

export default {
  computed: {
    layout() {
      return (this.$route.meta.layout || DEFAULT_LAYOUT) + 'Layout'
    },
  },
}
</script>
