<template>
  <div class="report-overview">
    <p style="padding-bottom: 10px;">
      <strong>Exchange Test</strong></br>
      Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore 
      et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. 
      Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, 
      consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, 
      sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea 
      takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed 
      diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et 
      accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum 
      dolor sit amet.
    </p>
    <p style="padding-bottom: 10px;">
      <strong>Summary</strong></br>
      Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore 
      et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. 
      Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, 
      consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, 
      sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea 
      takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed 
      diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et 
      accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum 
      dolor sit amet.
    </p>
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
            'Femur_L': "succeeded",
            'Body': "even better",
            'PVT50_4': "show all the props"
          },
          {
            'Femur_R': "succeeded",
            'PVT_45': "even better",
            'Bladder': "show all the props",
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
