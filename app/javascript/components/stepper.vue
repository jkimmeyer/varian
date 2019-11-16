<template>
  <section>
    <b-steps
      v-model="activeStep"
      :animated="isAnimated"
      :has-navigation="hasNavigation"
      :icon-prev="prevIcon"
      :icon-next="nextIcon">
      <b-step-item label="Organ Countouring" :clickable="isStepsClickable">
        <h1 class="title has-text-centered">Organ Countouring</h1>
        <div class="view">
          <v-select></v-select>
          <div class="plan"></div>
        </div>
      </b-step-item>

      <b-step-item label="Gross Deviation" :clickable="isStepsClickable" :type="{'is-success': isProfileSuccess}">
        <h1 class="title has-text-centered">Gross Deviation</h1>
        Lorem ipsum dolor sit amet.
      </b-step-item>

      <b-step-item label="Dose Distribution" :clickable="isStepsClickable">
        <h1 class="title has-text-centered">Dose Distribution</h1>
        Lorem ipsum dolor sit amet.
      </b-step-item>

      <b-step-item label="Treatment Protocol" :clickable="isStepsClickable" disabled>
        <h1 class="title has-text-centered">Treatment Protocol</h1>
        Lorem ipsum dolor sit amet.
      </b-step-item>

      <b-step-item label="Optimatility of Treatment" :clickable="isStepsClickable" disabled>
        <h1 class="title has-text-centered">Optimatility of Treatment</h1>
        Lorem ipsum dolor sit amet.
      </b-step-item>

      <b-step-item label="Robustness and Treatment safety" :clickable="isStepsClickable" disabled>
        <h1 class="title has-text-centered">Robustness and Treatment safety</h1>
        Lorem ipsum dolor sit amet.
      </b-step-item>
    </b-steps>
  </section>
</template>

<script>
import VSelect from "./select"
    export default {
      name: 'stepper',
      components: {
        VSelect
      },
      data() {
        return {
            activeStep: 0,
            isAnimated: true,
            hasNavigation: true,
            prevIcon: 'chevron-left',
            nextIcon: 'chevron-right',
            isStepsClickable: true,
        }
      }
    }
</script>

<style lang="scss">
 .plan {
   width: 50%;
   height: 60vh;
   background-color: green;
 }

 .view {
   display: flex;
   justify-content: space-around;
  }
</style>
