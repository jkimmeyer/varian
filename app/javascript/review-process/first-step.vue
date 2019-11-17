<template>
  <div class="review-step columns">
    <div id="model" class="model column is-half">
      <v-3d-renderer></v-3d-renderer>
    </div>
    <div class="side column is-half">
      <v-select :options="options"></v-select>
      <b-input maxlength="200" type="textarea" v-model="comment"></b-input>
      <b-button type="is-primary" @click="snackbar()"> Add Comment</b-button>
    </div>
  </div>
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
