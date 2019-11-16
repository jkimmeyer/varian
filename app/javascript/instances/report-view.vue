<template>
  <div class="page">
    <div id="default">
      <the-header></the-header>
      <report-overview ></report-overview>
      <b-label>Any further comments</b-label>
      <b-input maxLength="400" type="textarea"></b-input>
      <div class="buttons">
        <b-button type="is-danger" @click="updateStatus('rejected', patientId, treatmentPlanId)">Decline</b-button>
        <b-button type="is-success" @click="updateStatus('approved', patientId, treatmentPlanId)">Approve</b-button>
      </div>
    </div>
  </div>
</template>

<script>

import TheHeader from '../components/header';
import ReportOverview from '../components/report-overview';
import { updateStatus } from '../api/patients'

export default {
  components: {
    TheHeader,
    ReportOverview,
  },
  props: {
    treatmentPlanId: {
      type: Number,
      default: 1,
    },
    patientId: {
      type: Number,
      default: 1,
    }
  },
  data() {
    return {
    }
  },
}

</script>

<style lang="scss">
.buttons {
  margin-top: 20px;
}
</style>
