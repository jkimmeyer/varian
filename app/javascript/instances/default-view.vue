<template>
  <div id="app">
    <b-button type="is-primary">{{ message }}</b-button>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      message: "Hello Vue!"
    }
  }
}

</script>
