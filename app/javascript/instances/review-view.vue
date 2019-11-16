<template>
  <div id="review">
    <stepper class="stepper"></stepper>
    <b-button type="is-primary">{{ message }}</b-button>
    <div>{{posts}}</div>
  </div>
</template>

<script>
import axios from 'axios'

import Stepper from '../components/stepper'

export default {
  components: {
    Stepper
  },
  data() {
    return {
      posts: [],
      errors: []
    }
  },
  // Fetches posts when the component is created.
  created() {
    axios.get('http://localhost:3000/api/patients')
    .then(response => {
      // JSON responses are automatically parsed.
      this.posts = response.data
    })
    .catch(e => {
      this.errors.push(e)
    })
  }
}
</script>

<style lang="scss">
  .stepper {
    margin-top: 20px
  }
</style>
