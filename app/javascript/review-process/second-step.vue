<template>
  <div class="review-step columns">
    <div class="model column is-half">
      <h1 class="title">Gross Deviation</h1>
      <b-table :data="data" :columns="columns" :selected.sync="selected" focusable></b-table>
      <b-button type="is-primary" @click="sendComment(comment)"> Add Comment</b-button>
    </div>
    <div class="side column is-half">
    </div>
  </div>
</template>

<script>
import { postReview } from "../api/patients.js"

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
  props: {
    patientId: {
      type: Number,
      default: null,
    }
  },
  methods: {
    sendComment: function (payload) {
      postReview('comments', payload);
    }
  }
}
</script>
