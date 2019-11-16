<template>
  <div class="step-3 columns">
    <div id="model column is-half" class="model">
      <v-2d-isodoses :patientId="patientId"></v-2d-isodoses>
    </div>
    <div class="side column is-half">
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
    treatmentPlan: {
      type: Object,
      default: {},
      required: true,
    }
}
</script>

<style lang="scss">

</style>
