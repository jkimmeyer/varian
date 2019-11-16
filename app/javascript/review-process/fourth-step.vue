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
import { sendData } from "../api/api.js"

export default {
  name: "the-fourth-step",
  components: {
  },
  data () {
    return {
      comment: ''
    }
  },
  methods: {
    sendComment: function (payload) {
      sendData('comments', payload);
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
