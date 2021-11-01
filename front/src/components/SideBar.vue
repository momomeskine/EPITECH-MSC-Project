<template>
  <nav :class="{ collapse: isCollapse }">
    <div class="title" @click="collapseSideBar()">
      <div class="big">T</div>
      <div class="minus">ime</div>
      <div class="big">M</div>
      <div class="minus">anager</div>
    </div>
    <router-link v-for="route in routes" :key="route.title" :to="route.path" class="link">
      <font-awesome-icon :icon="route.icon" class="icon" />
      <span class="route-name">{{ route.title }}</span>
    </router-link>
  </nav>
</template>

<script>
export default {
  data() {
    return {
      isCollapse: false,
      routes: [
        { title: 'Home', path: { name: 'Home' }, icon: ['fas', 'user'] },
        { title: 'About', path: { name: 'About' }, icon: ['far', 'user'] },
        { title: 'Sign Up', path: { name: 'SignUp' }, icon: ['far', 'hourglass'] },
        { title: 'Sign In', path: { name: 'SignIn' }, icon: ['far', 'hourglass'] },
      ],
    }
  },
  methods: {
    collapseSideBar(val) {
      if (val !== undefined) this.isCollapse = val
      else this.isCollapse = !this.isCollapse
    },
  },
}
</script>

<style lang="scss" scoped>
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
      // justify-content: center;
      // padding-left: 0;

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
    font-family: 'kanit';
    font-weight: 500;
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
    margin: 0.5rem 0;
    color: #989898;
    border-left: 3px solid #00000000;
    font-family: 'kanit';
    font-weight: 500;
    font-size: 1.25rem;

    &:hover {
      border-left-color: #989898;
    }

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
