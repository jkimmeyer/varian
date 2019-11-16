<template>
  <div class="page">
    <div id="patient">
      <the-header></the-header>
      <v-3d-renderer></v-3d-renderer>
    </div>
  </div>
</template>

<script>

import TheHeader from '../components/header';
import V3dRenderer from '../components/3d-renderer'

export default {
  components: {
    TheHeader,
    V3dRenderer,
  },
  data() {
      return {
      }
    },
}
</script>
