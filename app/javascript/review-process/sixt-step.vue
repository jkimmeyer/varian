<template>
  <section class="section">
    <div class="review-step columns">
      <div class="model column is-half">
      </div>
      <div class="side column is-half">
        <div class="field">
          <b-checkbox>Position</b-checkbox>
        </div>

        <div class="field">
          <b-checkbox>
            Safety
          </b-checkbox>
        </div>
      </div>

      <a class="button is-primary" href="/report">Summary</a>
    </div>
  </section>
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
