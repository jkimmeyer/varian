<template>
  <div class="review-step">
    <h1 class="title has-text-centered">Organ Countouring</h1>
    <div class="side">
    </div>
    <div id="model" class="model">
      <v-3d-renderer></v-3d-renderer>
    </div>
  </div>
</template>

<script>
import { postReview } from "../api/patients.js"
import V3dRenderer from "../components/3d-renderer"

export default {
  name: "the-third-step",
  components: {
    V3dRenderer
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

</style>
