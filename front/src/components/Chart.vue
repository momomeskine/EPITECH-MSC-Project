<template>
  <div class="Chart">
    <canvas ref="myChart"></canvas>
  </div>
</template>

<script>
import { Chart, LineElement, BarElement, PointElement, LineController, BarController, CategoryScale, LinearScale } from 'chart.js'

export default {
  name: 'SummaryCard',
  props: { color: String, icon: Array },
  data() {
    return {
      bgPostion: '0px 0px',
    }
  },
  beforeCreate() {
    Chart.register(BarElement, LineElement, PointElement, LineController, BarController, CategoryScale, LinearScale)
  },
  mounted() {
    const data = {
      labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
      datasets: [
        {
          label: 'Dataset 1',
          data: [100, 200, 10],
          backgroundColor: 'hsl(318, 52%, 74%)',
        },
        {
          label: 'Dataset 2',
          data: [100, 200, 50],
          backgroundColor: 'hsl(208, 55%, 74%)',
        },
        {
          label: 'Dataset 3',
          data: [100, 30, 10],
          backgroundColor: 'hsl(85, 58%, 74%)',
        },
      ],
    }
    const config = {
      type: 'bar',
      data: data,
      options: {
        // plugins: {
        //   title: {
        //     display: true,
        //     text: 'Chart.js Bar Chart - Stacked',
        //   },
        // },
        responsive: true,
        scales: {
          x: {
            stacked: true,
          },
          y: {
            stacked: true,
          },
        },
      },
    }
    const myChart = new Chart(this.$refs.myChart, config)
  },
  methods: {},
}
</script>

<style lang="scss" scoped>
</style>
