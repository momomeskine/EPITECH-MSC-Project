<template>
  <div id="main-container">
    <div class="container">
      <Header title="Home Dashboard" />
      <div class="content">
        <div class="cards">
          <SummaryCard color="#f7e6f2" :icon="['far', 'clock']" />
          <SummaryCard color="#e7f0f8" :icon="['far', 'chart-bar']" />
          <SummaryCard color="#f0f8e5" :icon="['far', 'clock']" />
          <SummaryCard color="#eceaf7" :icon="['far', 'chart-bar']" />
        </div>
        <Loader v-if="loading" />
        <div v-else>
          content
          <Chart />
        </div>
      </div>
    </div>
    <div class="side-info">
      <h2>Owner's Controls</h2>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Home',
  components: {
    Header: () => import('@/components/Header'),
    SummaryCard: () => import('@/components/SummaryCard'),
    Loader: () => import('@/components/Loader'),
    Chart: () => import('@/components/Chart'),
  },
  data() {
    return {
      loading: false,
    }
  },
}
</script>

<style lang="scss" scoped>
#main-container {
  display: flex;
  flex-direction: row;
}

.container {
  flex: 1;
  display: flex;
  flex-direction: column;
  height: 100%;

  .content {
    flex: 1;
    display: flex;
    flex-direction: column;
    padding: 0 2rem 2rem 2rem;
    overflow: auto;
    scrollbar-width: thin;
    scroll-behavior: smooth;

    .cards {
      display: flex;
      flex-direction: row;
      justify-content: space-between;
      width: 100%;
      margin-bottom: 1rem;

      > * {
        width: 24%;
      }
    }

    .Loader {
      align-self: center;
      margin-top: 6rem;
    }
  }
}

.side-info {
  width: 24rem;
  height: 100%;
  padding: 2rem 1.25rem;
  background-color: #fafafa;

  h2 {
    @extend %font-lg;
    font-size: 1.5rem;
  }
}
</style>
