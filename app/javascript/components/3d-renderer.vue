<template>
  <div></div>
</template>

<script>
import { ThreeJSHelper, animate } from '../threejs/functions'

export default {
  name: "v-3d-renderer",
  created () {
    ThreeJSHelper.init();
    animate();
  }
}
</script>
