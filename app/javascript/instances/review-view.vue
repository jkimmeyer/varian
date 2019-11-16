<template>
  <div class="page">
    <the-header></the-header>

    <div id="review">
        <b-steps
          class="stepper"
          v-model="activeStep"
          :animated="isAnimated"
          :has-navigation="hasNavigation"
          :icon-prev="prevIcon"
          :icon-next="nextIcon"
          destroy-on-hide>

          <b-step-item label="Organ Countouring" :clickable="isStepsClickable">
            <the-first-step :patientId="patientId" :treatmentPlan="treatmentPlan"></the-first-step>
          </b-step-item>

          <b-step-item label="Gross Deviation" :clickable="isStepsClickable">
            <the-second-step :patientId="patientId" :treatmentPlan="treatmentPlan"></the-second-step>
          </b-step-item>

          <b-step-item label="Dose Distribution" :clickable="isStepsClickable">
            <the-third-step :patientId="patientId" :treatmentPlan="treatmentPlan"></the-third-step>
          </b-step-item>

          <b-step-item label="Treatment Protocol" :clickable="isStepsClickable" disabled>
            <the-fourth-step :patientId="patientId" :treatmentPlan="treatmentPlan"></the-fourth-step>
          </b-step-item>

          <b-step-item label="Optimatility of Treatment" :clickable="isStepsClickable" disabled>
            <the-fifth-step :patientId="patientId" :treatmentPlan="treatmentPlan"></the-fifth-step>
          </b-step-item>

          <b-step-item label="Robustness and Treatment safety" :clickable="isStepsClickable" disabled>
            <the-sixt-step :patientId="patientId" :treatmentPlan="treatmentPlan"></the-sixt-step>
          </b-step-item>
        </b-steps>
      </div>
  </div>
</template>

<script>
import TheFirstStep from '../review-process/first-step'
import TheSecondStep from '../review-process/second-step'
import TheThirdStep from '../review-process/third-step'
import TheFourthStep from '../review-process/fourth-step'
import TheFifthStep from '../review-process/fifth-step'
import TheSixtStep from '../review-process/sixt-step'
import TheHeader from '../components/header'

import { getCurrentTreatmentPlan } from '../api/patients'

export default {
  components: {
    TheFirstStep,
    TheSecondStep,
    TheThirdStep,
    TheFourthStep,
    TheFifthStep,
    TheSixtStep,
    TheHeader
  },
  data() {
    return {
      patientId: null,
      activeStep: 0,
      isAnimated: true,
      hasNavigation: true,
      prevIcon: 'chevron-left',
      nextIcon: 'chevron-right',
      isStepsClickable: true,
      treatmentPlan: {},
    }
  },
  async created () {
    let url = window.location.pathname;
    this.patientId = parseInt(url.substring(url.lastIndexOf('/') + 1));
    let response = await getCurrentTreatmentPlan(parseInt(url.substring(url.lastIndexOf('/') + 1)));
    this.treatmentPlan = response.data;
  }
}
</script>

<style lang="scss">
 .plan {
   width: 50%;
   height: 60vh;
   background-color: green;
 }

  .stepper {
    margin-top: 20px
  }

 .view {
   display: flex;
   justify-content: space-around;
  }
</style>
