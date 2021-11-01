<template>
  <div id="layout">
    <slot />
  </div>
</template>

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
}
</style>
