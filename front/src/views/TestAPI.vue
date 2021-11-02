<template>
  <div id="main-container">
    <Loader v-if="loading" />
    <div class="container" v-else>
      <div class="block" v-for="(item, idx) in data" :key="idx">
        <pre>
        {{ item }}
        </pre>
        <hr />
      </div>
    </div>
  </div>
</template>

<script>
// import { apiServer } from '@/api/server.api.js'
import { apiServer } from '../api/server.api.js'

export default {
  name: 'Home',
  components: {
    Loader: () => import('@/components/Loader'),
  },
  data() {
    return {
      loading: true,
      data: [],
    }
  },
  async mounted() {
    this.data = []
    let res
    try {
      res = await apiServer.getUsers()
      this.data.push(res)
      console.log(await apiServer.getUsers())
    } catch (error) {
      this.data.push({ api: 'getUsers', error })
    }

    try {
      res = await apiServer.updateUser({ username: 'test1' })
      this.data.push(res)
    } catch (error) {
      this.data.push({ api: 'updateUser', error })
    }

    try {
      res = await apiServer.createUser('test@front.com', 'testfront')
      this.data.push(res)
    } catch (error) {
      this.data.push({ api: 'createUser', error })
    }
    this.loading = false
  },
}
</script>

<style lang="scss" scoped>
#main-container {
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
  overflow: auto;
}
.container {
  width: 100%;

  .block {
    width: 100%;
    margin-bottom: 1rem;
  }
}
</style>
