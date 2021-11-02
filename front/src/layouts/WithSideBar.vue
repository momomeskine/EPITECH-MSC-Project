<template>
  <div id="layout">
    <SideBar />
    <slot />
  </div>
</template>

<script>
export default {
  data() {
    return {}
  },
  components: {
    SideBar: () => import('@/components/SideBar'),
  },
  methods: {},
}
</script>

<style lang="scss" scoped>
#layout {
  display: flex;
  flex-direction: row;
  height: 100%;
  width: 100%;
}

#main-container {
  flex: 1;
  position: relative;
  z-index: 0;
  // background-color: #fff;
}
</style>
