<template>
  <div class="SummaryCard" :style="{ backgroundColor: color }">
    <div class="figure" :style="{ backgroundPosition: bgPostion }">
      <div class="pins">
        <div class="shape" :style="{ backgroundColor: color }"></div>
        <font-awesome-icon :icon="icon" class="icon" />
      </div>
    </div>
    <div class="title">Card</div>
  </div>
</template>

<script>
export default {
  name: 'SummaryCard',
  props: { color: String, icon: Array },
  data() {
    return {
      bgPostion: '0px 0px',
    }
  },
  created() {
    this.bgPostion = `${Math.round(Math.random() * 80)}% ${Math.round(Math.random() * 80)}%`
  },
  methods: {},
}
</script>

<style lang="scss" scoped>
.figure {
  position: relative;
  height: 8rem;
  width: 100%;
  background-color: rgb(180, 180, 180);
  background-image: url('../assets/bg-card1.webp');
  background-size: 1200px;
  background-repeat: no-repeat;
  background-blend-mode: overlay;

  .pins {
    position: absolute;
    top: 1rem;
    left: 1rem;

    .shape {
      height: 2rem;
      width: 2rem;
      border-radius: 3rem;
      opacity: 0.8;
    }

    .icon {
      position: absolute;
      top: 0.5rem;
      left: 0.5rem;
      font-size: 2rem;
      color: #1d1c1d;
    }
  }
}

.title {
  padding: 1rem;
  @extend %font-md;
  font-size: 1.25rem;
}
</style>
