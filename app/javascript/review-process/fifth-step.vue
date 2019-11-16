<template>
  <section class="section">
    <div class="review-step columns">
      <div class="model colucolumn is-halfmn">
        <div class="threejs">
          <div>{{ currentPlan }}</div>
        </div>
      </div>
      <div class="side column is-half"></div>

      <b-button type="is-primary" :disabled="currentPlan === 1" @click="previous()">Previous Plan</b-button>
      <b-button type="is-primary" :disabled="currentPlan > plans.length" @click="next()">Next Plan</b-button>
    </div>
  </section>
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
