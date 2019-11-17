<template>
    <section class="patient-overview">
      <b-collapse
        class="card"
        v-for="(patient, index) of patients"
        :key="index"
        :open="isOpen == index"
        @open="isOpen = index">
        <div
          slot="trigger"
          slot-scope="props"
          class="card-header"
          role="button"
          @click="treatmentPlan(patient.id)">
          <b-tag class="card-badge" :type="tagColor(patient.status)">{{ patient.status }}</b-tag>
          <p class="card-header-title">
            {{ patient.firstName }} {{ patient.lastName }}
          </p>

          <a href="/home/1" class="card-header-icon">
            <b-icon
              icon="account-arrow-right">
            </b-icon>
          </a>

          <a class="card-header-icon">
            <b-icon
              :icon="props.open ? 'menu-down' : 'menu-up'">
            </b-icon>
          </a>
        </div>
        <div class="card-content">
          <div class="content">
            <h5>TreatmentPlan History</h5>
            <ul class="patient-information">
              <li v-bind:key="treatmentPlan" v-for="treatmentPlan in patient.treatmentPlans">
                <a v-bind:href="'/patients/' + patient.id + '/treatmentPlans/' + treatmentPlan.id">{{ treatmentPlan.name }}</a>
              </li>
            </ul>
          </div>
        </div>
      </b-collapse>
    </section>
</template>

<script>
export default {
  name: 'patient-overview',
  props: {
    patients: {
      type: Array,
    }
  },
  data() {
    return {
      patientReviewState: 'In Progress',
      isOpen: null,
    }
  },
  methods: {
    tagColor: function (status) {
      if(status === 'created') {
        return 'is-info';
      }else if (status === "approved") {
        return 'is-success';
      } else {
        return 'is-danger';
      }
    }
  }
}
</script>

<style>
  .card-header {
    display: flex;
    align-items: center !important;
  }

  .card-badge {
    margin-left: 10px
  }

  a:hover,
  a:focus,
  a:active {
    text-decoration: underline #3a4b57;
  }
</style>
