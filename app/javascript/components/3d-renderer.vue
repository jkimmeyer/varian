<template>
  <div></div>
</template>

<script>
import { init, animate } from '../threejs/functions'

export default {
  name: "v-3d-renderer",
  created () {
    init();
    animate();
  }
}
</script>
