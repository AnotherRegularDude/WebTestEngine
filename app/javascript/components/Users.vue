<template>
  <section class="section">
    {{ userRole }}
  </section>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  computed: {
    ...mapGetters(["userRole"]),
  },
};
</script>

<style>
</style>
