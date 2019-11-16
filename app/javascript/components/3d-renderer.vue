<template>
  <div id="renderer">
  </div>
</template>

<script>
import { ThreeJSHelper, animate } from '../threejs/functions'

export default {
  name: "v-3d-renderer",
  mounted () {
    ThreeJSHelper.init();
    animate();
  }
}
</script>
