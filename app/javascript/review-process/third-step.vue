<template>
  <div class="step-3">
    <h1 class="title has-text-centered">Organ Countouring</h1>
    <div class="view">
      <div class="threejs">

      </div>
    </div>
  </div>
</template>

<script>
import { postReview } from "../api/patients.js"

export default {
  name: "the-third-step",
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
