<template>
  <div id="app">
    <the-header></the-header>
    <patient-overview></patient-overview>
    <b-button type="is-primary">{{ message }}</b-button>
  </div>
</template>

<script>
import TheHeader from '../components/header';
import PatientOverview from '../components/patient-overview';

export default {
  components: {
    TheHeader,
    PatientOverview,
  },
  data: function () {
    return {
      message: "Hello Vue!"
    }
  }
}

</script>
