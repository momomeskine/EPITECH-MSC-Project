<template>
  <div class="Loader"></div>
</template>

<script>
export default {
  name: 'Loader',
}
</script>

<style lang="scss" scoped>
$square_length: 2rem;
$circle_length: 0.85rem;
.Loader {
  position: relative;
  width: $square_length;
  height: $square_length;
  background-color: rgba(0, 0, 0, 0.3);

  &::before {
    content: '';
    position: absolute;
    background-color: rgba(0, 0, 0, 0.8);
    height: $circle_length;
    width: $circle_length;
    border-radius: 10px;
    animation: loader7 2s ease-in-out infinite;
  }
}

@keyframes loader7 {
  0% {
    left: -$circle_length;
    top: -$circle_length;
  }
  25% {
    left: $square_length;
    top: -$circle_length;
  }
  50% {
    left: $square_length;
    top: $square_length;
  }
  75% {
    left: -$circle_length;
    top: $square_length;
  }
  100% {
    left: -$circle_length;
    top: -$circle_length;
  }
}
</style>
