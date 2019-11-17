<template>
  <section class="section">
    <div class="review-step columns">
      <div class="model column is-half">
        <v-3d-renderer></v-3d-renderer>
      </div>
      <div class="side column is-half">
        <b-input maxlength="200" type="textarea" v-model="comment"></b-input>
        <b-button type="is-primary" @click="snack()">Add Comment</b-button>
      </div>
    </div>
  </section>
</template>

<script>
import { postReview } from "../api/patients.js"
import V3dRenderer from '../components/3d-renderer'

export default {
  name: "the-second-step",
  components: {
    V3dRenderer
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
    },
    treatmentPlan: {
      type: Object,
      default: {},
      required: true,
    }
  },
  methods: {
    sendComment: function (payload) {
      postReview('comments', payload);
    },
    snack() {
      this.$buefy.snackbar.open(`Comment sent!`)
    },
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
