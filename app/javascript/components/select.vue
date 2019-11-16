<template>
  <div class="comment">
    <b-field>
      <b-select
        multiple
        :native-size="options.length"
        v-model="selectedOptions">
        <option v-bind:key="option" v-for="option in options" :value="option">{{ option }}</option>
      </b-select>
    </b-field>
  </div>
  </template>
<script>

export default {
  name: 'v-select',
  props: {
    options: {
      type: Array,
    }
  },
  data() {
    return {
      selectedOptions: [],
    }
  }
}
</script>
