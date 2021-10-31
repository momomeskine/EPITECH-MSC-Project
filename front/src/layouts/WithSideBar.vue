<template>
  <div id="layout">
    <nav>
      <router-link to="/">Home</router-link> |
      <router-link to="/about">About</router-link>
    </nav>
    <slot />
  </div>
</template>

<script>
export default {
  methods: {
    logout() {
      document.cookie = 'Authorization=; expires=Thu, 01 Jan 1970 00:00:00 GMT; path=/'
      this.$router.push({ name: 'SignIn' })
    },
    clearCookies() {
      document.cookie.split(';').forEach((c) => {
        document.cookie = c.replace(/^ +/, '').replace(/=.*/, '=;expires=' + new Date().toUTCString() + ';path=/')
      })
    },
  },
}
</script>
