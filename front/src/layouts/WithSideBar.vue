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

nav {
  display: flex;
  flex-direction: column;
  height: 100%;
  width: 16rem;
  overflow-y: auto;
  scrollbar-width: thin;
  scroll-behavior: smooth;
  border-right: 2px solid #f2f2f2;
  transition: width 0.1s ease-in-out;

  &.collapse {
    width: 6rem;

    .title .minus {
      display: none;
    }

    .link {
      justify-content: center;
      padding-left: 0;

      .route-name {
        display: none;
      }
    }
  }

  .title {
    display: flex;
    flex-direction: row;
    align-items: baseline;
    align-self: center;
    @extend %font-lg;
    font-size: 1.5rem;
    margin: 2rem 0;
    cursor: pointer;

    .big {
      font-size: 3rem;
      font-weight: 400;
    }
  }

  .link {
    display: flex;
    flex-direction: row;
    align-items: center;
    padding-left: 2rem;
    width: 100%;
    height: 3rem;
    color: #989898;
    border-left: 3px solid #00000000;
    @extend %font-lg;
    font-size: 1.25rem;

    &.router-link-exact-active {
      border-left-color: #101010;
      color: #101010;
    }

    .icon {
      font-size: 1.5rem;
    }

    .route-name {
      margin-left: 1.25rem;
    }
  }
}
</style>
