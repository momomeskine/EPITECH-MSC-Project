<template>
  <div class="about" id="main-container">
    <IconTest />
  </div>
</template>

<script>
export default {
  name: 'About',
  components: {
    IconTest: () => import('@/components/IconTest.vue'),
  },
}
</script>
