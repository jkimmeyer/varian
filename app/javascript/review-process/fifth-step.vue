<template>
  <div class="review-step">
    <h1 class="title has-text-centered">Treatment Protocol</h1>
    <div class="side"></div>
    <div class="model">
      <div class="threejs">
        <div>{{ currentPlan }}</div>
      </div>
    </div>

    <b-button type="is-primary" :disabled="currentPlan === 1" @click="previous()">Previous Plan</b-button>
    <b-button type="is-primary" :disabled="currentPlan > plans.length" @click="next()">Next Plan</b-button>
  </div>
</template>

<script>
import { postReview } from "../api/patients.js"

export default {
  name: "the-fifth-step",
  components: {
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
  data () {
    return {
      currentPlan: 1,
      plans: [1, 2, 3, 4]
    }
  },
  methods: {
    next: function () {
      this.currentPlan++;
    },
    previous: function () {
      this.currentPlan--;
    },
    sendComment: function (payload) {
      postReview('comments', payload);
    }
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
