<template>
  <b-navbar class="header">
    <template slot="brand">
      <b-navbar-item tag="router-link" :to="{ path: '/' }">
        <div class="header-brand-name">
          <img
              src="https://upload.wikimedia.org/wikipedia/commons/9/9c/Varian_company_logo_2017.png"
              alt="Varian"
          >
          <strong>RTMS</strong>
        </div>
      </b-navbar-item>
    </template>

    <template slot="start">
      <b-navbar-item href="/">
      </b-navbar-item>

      <b-navbar-item href="/">
        Overview
      </b-navbar-item>
      <b-navbar-item href="/">
        Patients
      </b-navbar-item>
    </template>

    <template slot="end">
      <b-navbar-item tag="div">
        <strong>Dr. Ferris Goodwell</strong>
      </b-navbar-item>

      <b-navbar-item tag="div">
        <div class="buttons">
          <a class="button is-light">
            Log out
          </a>
        </div>
      </b-navbar-item>
    </template>
  </b-navbar>
</template>

<script>
export default {
  name: "the-header",
}
</script>

<style lang="scss">
.header {
  margin: -20px -20px 20px;
  background-color: rgba(240, 240, 240, 0.9);
}

.header-brand-name {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}
</style>
