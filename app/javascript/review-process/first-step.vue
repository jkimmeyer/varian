<template>
  <div class="step-1">
    <h1 class="title has-text-centered">Organ Countouring</h1>
    <div class="view">
      <v-select :options="options"></v-select>
      <b-input maxlength="200" type="textarea" v-model="comment"></b-input>
      <b-button type="is-primary" @click="sendComment(comment)"> Add Comment</b-button>
      <v-3d-renderer></v-3d-renderer>
    </div>
  </div>
</template>

<script>
import V3dRenderer from '../components/3d-renderer'
import VSelect from "../components/select"
import { sendData } from "../api/api.js"

export default {
  name: "the-first-step",
  components: {
    V3dRenderer,
    VSelect,
  },
  data () {
    return {
      options: [
        'Stomach', 'Heart', 'Brain', 'Tongue', 'liver', 'spinal cord'
      ],
      comment: ''
    }
  },
  methods: {
    sendComment: function (payload) {
      let path = 'patient/3/plan/2/review/1/comments'
      sendData(path, payload);
    }
  }
}
</script>
