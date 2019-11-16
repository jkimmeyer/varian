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
          role="button">
          <b-tag class="card-badge" type="is-info">{{ patientReviewState }}</b-tag>
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
    },
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
</style>
