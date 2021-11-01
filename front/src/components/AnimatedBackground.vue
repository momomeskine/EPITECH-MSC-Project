<template>
  <div class="AnimatedBackground">
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1600 900">
      <!-- <rect fill="#000" width="1600" height="900" /> -->
      <defs>
        <linearGradient id="a" x1="0" x2="0" y1="1" y2="0" gradientTransform="rotate(0,0.5,0.5)">
          <stop offset="0" stop-color="#0FF" />
          <stop offset="1" stop-color="#CF6" />
        </linearGradient>
        <linearGradient id="b" x1="0" x2="0" y1="0" y2="1" gradientTransform="rotate(0,0.5,0.5)">
          <stop offset="0" stop-color="#F00" />
          <stop offset="1" stop-color="#FC0" />
        </linearGradient>
      </defs>
      <g fill="#FFF" fill-opacity="0" stroke-miterlimit="10">
        <g stroke="url(#a)">
          <path class="shape-move shape1" stroke-width="5" d="M1409 581 1450.35 511 1490 581z" />
          <circle class="shape-move shape2" stroke-width="5" cx="500" cy="100" r="40" />
          <path
            class="shape-move shape3"
            stroke-width="5"
            d="M400.86 735.5h-83.73c0-23.12 18.74-41.87 41.87-41.87S400.86 712.38 400.86 735.5z"
          />
        </g>
        <g stroke="url(#b)">
          <path class="shape-move shape4" stroke-width="5" d="M149.8 345.2 118.4 389.8 149.8 434.4 181.2 389.8z" />
          <rect class="shape-move shape5" stroke-width="5" x="1039" y="709" width="100" height="100" />
          <path
            class="shape-move shape6"
            stroke-width="5"
            d="M1426.8 132.4 1405.7 168.8 1363.7 168.8 1342.7 132.4 1363.7 96 1405.7 96z"
          />
        </g>
      </g>
    </svg>
  </div>
</template>

<script>
export default {
  name: 'AnimatedBackground',
}
</script>

<style lang="scss" scoped>
svg {
  width: 100%;
  height: 100%;
}

.shape-move {
  &.shape1 {
    transform: translate(-55px, 100px) rotate(6deg) scale(0.9);
    animation: float1 6s ease-in-out infinite;
  }
  &.shape2 {
    transform: rotate(0deg);
    animation: float2 6s ease-in-out infinite;
    animation-delay: 1s;
  }
  &.shape3 {
    transform: translate(-350px, 0px) rotate(-12deg) scale(1.2);
    animation: float3 6s ease-in-out infinite;
    animation-delay: 2s;
  }
  &.shape4 {
    transform: translate(200px, 100px) rotate(-2deg);
    animation: float4 6s ease-in-out infinite;
    animation-delay: 4s;
  }
  &.shape5 {
    transform: translate(40px, 300px) rotate(-32deg);
    animation: float5 6s ease-in-out infinite;
    animation-delay: 4s;
  }
  &.shape6 {
    transform: translate(0px, 100px) rotate(-5deg) scale(0.8);
    animation: float6 6s ease-in-out infinite;
    animation-delay: 5s;
  }
}

@keyframes float1 {
  0% {
    transform: translate(-55px, 100px) rotate(6deg) scale(0.9);
  }
  50% {
    transform: translate(-55px, 100px) rotate(5deg) scale(0.9);
  }
  100% {
    transform: translate(-55px, 100px) rotate(6deg) scale(0.9);
  }
}
@keyframes float2 {
  0% {
    transform: rotate(0deg);
  }
  50% {
    transform: rotate(4deg);
  }
  100% {
    transform: rotate(0deg);
  }
}
@keyframes float3 {
  0% {
    transform: translate(-350px, 0px) rotate(-12deg) scale(1.2);
  }
  50% {
    transform: translate(-330px, -20px) rotate(-12deg) scale(1.2);
  }
  100% {
    transform: translate(-350px, 0px) rotate(-12deg) scale(1.2);
  }
}
@keyframes float4 {
  0% {
    transform: translate(200px, 100px) rotate(-2deg);
  }
  50% {
    transform: translate(200px, 100px) rotate(2deg);
  }
  100% {
    transform: translate(200px, 100px) rotate(-2deg);
  }
}
@keyframes float5 {
  0% {
    transform: translate(40px, 300px) rotate(-32deg);
  }
  50% {
    transform: translate(40px, 300px) rotate(-31deg);
  }
  100% {
    transform: translate(40px, 300px) rotate(-32deg);
  }
}
@keyframes float6 {
  0% {
    transform: translate(0px, 100px) rotate(-5deg) scale(0.8);
  }
  50% {
    transform: translate(0px, 100px) rotate(-3deg) scale(0.8);
  }
  100% {
    transform: translate(0px, 100px) rotate(-5deg) scale(0.8);
  }
}
</style>
