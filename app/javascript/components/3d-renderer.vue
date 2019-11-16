<template>
  <div id="renderer">
  </div>
</template>

<script>
import { init, animate } from '../threejs/functions'

export default {
  name: "v-3d-renderer",
  mounted () {
    init();
    animate();
  }
}
</script>
