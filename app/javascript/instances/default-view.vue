<template>
  <div class="page">
    <div id="default">
      <the-header></the-header>
      <patient-overview :patients="patients"></patient-overview>
      <p v-if="patients.length == 0"> No patients found.</p>
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
      }
    },
  // Fetches posts when the component is created.
  async created () {
    let response = await getPatients();
    this.patients = response.data;
  }
}

</script>
