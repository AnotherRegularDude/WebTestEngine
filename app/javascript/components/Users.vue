<template lang="pug">
  section.hero.is-danger.is-medium
    .hero-body
      .container
        h1.title Section
        h2.subtitle {{ authHeader }} {{ isAuthorized }}
</template>

<script>
import { mapGetters } from "vuex";

export default {
  computed: {
    ...mapGetters(["isAuthorized", "authHeader"]),
  },
};
</script>

<style>
</style>
