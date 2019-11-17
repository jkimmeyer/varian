<template>
  <b-navbar class="header">
    <template slot="brand">
      <b-navbar-item :to="{ path: '/' }">
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
        Patients
      </b-navbar-item>
    </template>

    <template slot="end">
      <b-navbar-item tag="div">
        <img style="border-radius: 50% !important;" src="/doctor2.jpg">
      </b-navbar-item>
      <b-navbar-item tag="div">
        <strong>Dr. Ferris Goodwell</strong>
      </b-navbar-item>

      <b-navbar-item tag="div">
        <a class="button is-light">
          Log out
        </a>
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
