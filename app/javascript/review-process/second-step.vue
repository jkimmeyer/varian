<template>
  <div class="step-2">
    <h1 class="title has-text-centered">Organ Countouring</h1>
    <div class="view">
      <b-table :data="data" :columns="columns" :selected.sync="selected" focusable></b-table>
      <b-button type="is-primary" @click="sendComment(comment)"> Add Comment</b-button>
    </div>
  </div>
</template>

<script>
import { sendData } from "../api/api.js"

export default {
  name: "the-second-step",
  components: {
  },
  data () {
    const data = [
      { 'id': 'Treatement', 'dose-level': '3.4733 gy', 'field-geometries': '4.3003', 'monitor-units': '43.312'},
      { 'id': 'Expected', 'dose-level': '3.47123 gy', 'field-geometries': '4.3203', 'monitor-units': '43.312'},
      { 'id': 'Max. Value', 'dose-level': '2.31235 gy', 'field-geometries': '4.593', 'monitor-units': '43.312'},
      { 'id': 'Min. Value', 'dose-level': '5.41231 gy', 'field-geometries': '4.4953', 'monitor-units': '43.312'},
    ]

    return {
      data,
      comment: "",
      columns: [
        {
          field: 'id',
          label: '',
        },
        {
          field: 'dose-level',
          label: 'Dose Level',
        },
        {
          field: 'field-geometries',
          label: 'Field Geometries',
        },
        {
          field: 'monitor-units',
          label: 'Monitor Units'
        }
      ],
      selected: data[1],
    }
  },
  methods: {
    sendComment: function (payload) {
      sendData('comments', payload);
    }
  }
}
</script>
