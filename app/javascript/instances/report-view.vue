<template>
  <div class="page">
    <div id="default">
      <the-header></the-header>
      <report-overview ></report-overview>
      <b-label>Any further comments</b-label>
      <b-input maxLength="400" type="textarea"></b-input>
      <div class="buttons">
        <b-button type="is-danger">Decline</b-button>
        <b-button type="is-success">Approve</b-button>
      </div>
    </div>
  </div>
</template>

<script>
import { getReport } from '../api/patients'

import TheHeader from '../components/header';
import ReportOverview from '../components/report-overview';

export default {
  components: {
    TheHeader,
    ReportOverview,
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

<style lang="scss">
.buttons {
  margin-top: 20px;
}
</style>
