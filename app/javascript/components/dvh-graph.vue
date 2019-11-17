<template>
  <canvas id="dvh-graph" width="1000" height="600"></canvas>
</template>

<script>
  import Chart from 'chart.js';
  import { getCurrentTreatmentPlan } from '../api/patients';
  export default {
    name: 'v-dvh-graph',
    props: {
      patientId: {
        type: Number,
        default: 0,
      }
    },
    data() {
      return {
        curveDataSets: [],
      };
    },
    methods: {
      getRandomColor: function () {
        let letters = '0123456789ABCDEF',
            color = '#';
        for (var i = 0; i < 6; i++) {
          color += letters[Math.floor(Math.random() * 16)];
        }
        return color;
      }
    },
    mounted() {
      let context = this;
      this.response.then(function (data) {
        let curveDataSets = data.data.dvhCurves.map(function (curve) {
          let color = context.getRandomColor();
          return {
            label: curve.name,
            backgroundColor: color,
            borderColor: color,
            data: curve.curvePoints.map(point => ({ x: point.dose, y: point.volume })),
            showLine: true,
            fill: false,
          }
        });
        let ctx = document.getElementById('dvh-graph');
        console.log(curveDataSets)
        let dvhChart = new Chart(ctx, {
          type: 'scatter',
          data: {
            datasets: curveDataSets,
          },
          options: {
            responsive: true,
            title: {
              display: true,
              text: 'DVH Graph',
            },
            legend: {
              display: true,
              position: 'bottom',
              align: 'center',
            },
            tooltips: {
              position: 'average',
              intersect: false,
              callbacks: {
                label: function (tooltipItem, data) {
                  return [`${data.datasets[tooltipItem.datasetIndex].label}:`, `Dose: ${tooltipItem.xLabel}`, `Volume: ${tooltipItem.yLabel}`];
                }
              }
            },
          },
        });
      });
    },
    beforeMount() {
      this.response = getCurrentTreatmentPlan(this.patientId);
    },
  }
</script>