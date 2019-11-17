<template>
  <div class="report-overview">
    <div class="report-step" v-bind:key="report.key" v-for="report in reports">
      <ul class="report-step-list">
        <li class="report-step-list-item" v-bind:key="key" v-for="(value, key) in report">
          <div>{{ key }}: {{ value }}</div>
        </li>
      </ul>
      <b-button type="is-primary">Edit</b-button>
    </div>
  </div>
</template>

<script>
  export default {
    name: "report-overview",
    data () {
      return {
        reports: [
          {
            'test': "succeeded",
            'test2': "even better",
            'test3': "show all the props"
          },
          {
            'test': "succeeded",
            'test2': "even better",
            'test3': "show all the props",
          }
        ]
      }
    },
  }
</script>

<style lang="scss">
.report-step {
  margin-bottom: 30px;
}
</style>
