<template>
  <section class="section">
    <div class="step-3 columns">
      <div id="model column is-half" class="model">
        <v-2d-isodoses :patientId="patientId"></v-2d-isodoses>
      </div>
      <div class="side column is-half">
        <p style="padding-bottom: 10px;">
          <strong>Image 5</strong></br>
          Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore 
          et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. 
          Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.
        </p>
        <p style="padding-bottom: 10px;">
          <strong>Image 63</strong></br>
          Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore 
          et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. 
          Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.
        </p>
        <p style="padding-bottom: 10px;">
          <strong>Image 111</strong></br>
          Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore 
          et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. 
          Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.
        </p>
        <b-input maxlength="200" type="textarea" v-model="comment"></b-input>
        <b-button type="is-primary" @click="snack()">Add Comment</b-button>
      </div>
    </div>
  </section>
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
