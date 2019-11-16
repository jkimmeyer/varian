<template>
    <section>
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
          <p class="card-header-title">
            {{ patient.firstName }} {{ patient.lastName }}
          </p>
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
        isOpen: 0,
        patients: [],
    }
  }
}
</script>
