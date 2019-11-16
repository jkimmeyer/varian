<template>
  <div class="review-step">
    <h1 class="title has-text-centered">Robustness and Treatment safety</h1>
    <div class="side">
      <div class="field">
        <b-checkbox>Position</b-checkbox>
      </div>

      <div class="field">
        <b-checkbox>
          Safety
        </b-checkbox>
      </div>

      <a class="button is-primary" href="/report">Zusammenfassung</a>
    </div>

    <div class="model">
    </div>
  </div>
</template>

<script>
import { postReview } from "../api/patients.js"

export default {
  name: "the-sixt-step",
  components: {
  },
  data () {
    return {
      comment: ''
    }
  },
  methods: {
    sendComment: function (payload) {
      postReview('comments', payload);
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
}
</script>

<style lang="scss">
  .threejs {
    width: 60%;
    height: 80vh;
    background-color: green;
  }
</style>
