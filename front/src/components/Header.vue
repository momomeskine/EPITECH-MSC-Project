<template>
  <div class="Header">
    <h1>{{ title }}</h1>

    <div class="right-icons">
      <font-awesome-icon :icon="['far', 'question-circle']" class="icon" />
      <font-awesome-icon :icon="['far', 'question-circle']" class="icon" />
      <div class="profile">
        <div v-if="false" @click="toggleProfileMenu"></div>
        <div v-else @click="toggleProfileMenu" class="initial">TC</div>
        <div v-show="profileMenu" class="profile-menu">
          <div class="profile-info">
            <span>Email</span>
            <span>Username</span>
          </div>
          <button>Sign out</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Header',
  props: { title: String },
  data() {
    return {
      profileMenu: false,
    }
  },
  methods: {
    toggleProfileMenu() {
      this.profileMenu = !this.profileMenu
    },
  },
}
</script>

<style lang="scss" scoped>
.Header {
  width: 100%;
  height: 5rem;
  display: flex;
  flex-direction: row;
  align-items: last baseline;
  justify-content: space-between;
  padding: 0 2rem;
  margin-bottom: 1rem;

  h1 {
    @extend %font-lg;
    font-size: 2rem;
  }
}

.right-icons {
  display: flex;
  flex-direction: row;
  align-items: center;

  > * {
    margin-left: 1.25rem;
  }

  > .icon {
    font-size: 2rem;
  }
}

.profile {
  position: relative;
  width: 3rem;
  height: 3rem;
  cursor: pointer;
  user-select: none;

  .initial {
    width: 100%;
    height: 100%;
    overflow: hidden;
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 2rem;
    border: 2px solid #101010;
    background-color: rgba(94, 43, 160, 0.6);
    @extend %font-md;
    font-size: 1.1rem;
  }

  .profile-menu {
    position: absolute;
    top: 100%;
    right: 0;
    cursor: default;
    user-select: text;
    padding: 1.5rem;
    border-radius: $--r-box;
    background-color: #fafafa;
    border: 2px solid #f3f3f3;

    .profile-info {
      display: flex;
      flex-direction: column;
      margin-bottom: 1rem;
    }
  }
}
</style>
