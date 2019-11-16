<template>
  <div class="step-6">
    <h1 class="title has-text-centered">Robustness and Treatment safety</h1>
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
