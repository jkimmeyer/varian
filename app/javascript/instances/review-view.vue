<template>
  <div id="review">
    <stepper class="stepper"></stepper>
    <b-button type="is-primary">{{ message }}</b-button>
  </div>
</template>

<script>

import Stepper from '../components/stepper'

export default {
  components: {
    Stepper
  },
}
</script>

<style lang="scss">
  .stepper {
    margin-top: 20px
  }
</style>
