<template>
  <div class="review-step columns">
    <div class="model column is-half">
      <v-dvh-graph :patientId="patientId"></v-dvh-graph>
    </div>
    <div class="side column is-half">
      <b-input maxlength="200" type="textarea" v-model="comment"></b-input>
      <b-button type="is-primary" @click="snack()">Add Comment</b-button>
    </div>
  </div>
</template>

<script>
import { postReview } from "../api/patients.js"
import VDvhGraph from '../components/dvh-graph'

export default {
  name: "the-second-step",
  components: {
    VDvhGraph
  },
  data () {
    return {
      comment: ''
    }
  },
  props: {
    patientId: {
      type: Number,
      default: null,
    },
    treatmentPlan: {
      type: Object,
      default: {},
      required: true,
    }
  },
  methods: {
    sendComment: function (payload) {
      postReview('comments', payload);
    },
    snack() {
      this.$buefy.snackbar.open(`Comment sent!`)
    },
  }
}
</script>

<style lang="scss">
  .threejs {
    width: 60%;
    height: 80vh;
    background-color: green;
  }
</style>
