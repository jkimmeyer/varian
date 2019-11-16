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
import { getPatients } from '../api/patients'

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
    getPatients();
  }
}

</script>
