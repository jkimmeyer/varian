<template>
  <div class="step-3">
    <h1 class="title has-text-centered">Dose Distribution</h1>
    <div class="side">
    </div>
    <div id="model" class="model">
      <v-2d-isodoses :patientId="patientId"></v-2d-isodoses>
    </div>
  </div>
</template>

<script>
import { postReview } from "../api/patients.js"
import V2dIsodoses from "../components/2d-isodoses"

export default {
  name: "the-third-step",
  components: {
    V2dIsodoses
  },
  data () {
    return {
      comment: '',
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
