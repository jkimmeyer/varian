<template>
  <b-navbar>
    <template slot="brand">
      <b-navbar-item tag="router-link" :to="{ path: '/' }">
          <img
              src="https://upload.wikimedia.org/wikipedia/commons/9/9c/Varian_company_logo_2017.png"
              alt="Varian"
          >
      </b-navbar-item>
    </template>

    <template slot="start">
      <b-navbar-item href="/">
        Übersicht
      </b-navbar-item>
      <b-navbar-item href="/">
        Patienten
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
