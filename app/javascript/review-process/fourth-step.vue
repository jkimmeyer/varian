<template>
  <div class="step-4">
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
  name: "the-fourth-step",
  components: {
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
    }
  },
  methods: {
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
