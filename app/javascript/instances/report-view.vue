<template>
  <div class="page">
    <div id="default">
      <the-header></the-header>
      <section class="section">
        <div class="container" style="max-width:60vw;">
          <report-overview ></report-overview>
          <b-field label="Any further comments">
            <b-input maxLength="400" type="textarea"></b-input>
          </b-field>

          <div class="buttons">
            <b-button type="is-danger" @click="review('rejected', patientId, treatmentPlanId)">Decline</b-button>
            <b-button type="is-success" @click="review('approved', patientId, treatmentPlanId)">Approve</b-button>
          </div>
        </div>
      </section>
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
      default: 7,
    },
    patientId: {
      type: Number,
      default: 2,
    }
  },
  data() {
    return {
      status: "",
    }
  },
  methods: {
    review: function (status, patientId, treatmentPlanId) {
      updateStatus(status, patientId, treatmentPlanId)
      window.location.href= "/"
    }
  }
}

</script>

<style lang="scss">
.buttons {
  margin-top: 20px;
}
</style>
