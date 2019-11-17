<template>
  <section class="section">
    <div class="review-step columns">
      <div class="model column is-half">
        <v-dvh-graph :patientId="patientId"></v-dvh-graph>
      </div>
      <div class="side column is-half">
        <p style="padding-bottom: 10px;">
          <strong style="color: #0055ff">Bowel</strong></br>
          Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore 
          et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. 
          Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.
        </p>
        <p style="padding-bottom: 10px;">
          <strong style="color: #ff2e2e">Femur_L</strong></br>
          Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore 
          et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. 
          Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.
        </p>
        <b-input maxlength="200" type="textarea" v-model="comment"></b-input>
        <b-button type="is-primary" @click="snack()">Add Comment</b-button>
      </div>
    </div>
  </section>
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
