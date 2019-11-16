<template>
  <div class="review-step columns">
    <div class="model column is-half">
      <v-3d-renderer></v-3d-renderer>
    </div>
    <div class="side column is-half"></div>
  </div>
</template>

<script>
import { postReview } from "../api/patients.js"
import V3dRenderer from '../components/3d-renderer'

export default {
  name: "the-fourth-step",
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
