<template>
  <div class="page">
    <div id="default">
      <the-header></the-header>
      <patient-overview :patients="patients"></patient-overview>
      <b-button type="is-primary">Button</b-button>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
import TheHeader from '../components/header';
import PatientOverview from '../components/patient-overview';

export default {
  components: {
    TheHeader,
    PatientOverview,
  },
  data() {
      return {
        patients: [],
        errors: []
      }
    },
  // Fetches posts when the component is created.
  created() {
    axios.get('http://localhost:3000/api/patients')
    .then(response => {
      // JSON responses are automatically parsed.
      this.patients = response.data
    })
    .catch(e => {
      this.errors.push(e)
    })
  }
}

</script>
