<template>
  <section class="section">
    <div class="review-step columns">
      <div id="model" class="model column is-half">
        <v-3d-renderer></v-3d-renderer>
      </div>
      <div class="side column is-half">
        <v-select :options="options" style="margin-bottom:10px;"></v-select>
        <p style="padding-bottom: 10px;">
          <strong style="color: #ff2e2e">Femur_L</strong></br>
          Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore 
          et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. 
          Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.
        </p>
        <b-input maxlength="200" type="textarea" v-model="comment"></b-input>
        <b-button type="is-primary" @click="snackbar()"> Add Comment</b-button>
      </div>
    </div>
  </section>
</template>

<script>
import V3dRenderer from '../components/3d-renderer'
import VSelect from "../components/select"
import { postReview } from "../api/patients.js"

export default {
  name: "the-first-step",
  components: {
    V3dRenderer,
    VSelect,
  },
  props: {
    patientId: {
      type: Number,
      default: null,
    },
    treatmentPlan: {
      type: Object,
      default: {},
    }
  },
  data () {
    return {
      options: [],
      comment: '',
      selectedOptions: [],
    }
  },
  mounted(){
    this.options = ["Heart", "Rectum", "Liver", "Bladder", "Femur_L", "Femur_R"]
  },
  methods: {
    sendComment: function (payload) {
      let path = 'patient/3/plan/2/review/1/comments'
      postReview(path, payload);
    },
    snackbar() {
      this.$buefy.snackbar.open(`Comment sent!`)
    },
  }
}
</script>
