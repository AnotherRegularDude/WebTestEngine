<template>
  <section class="hero is-link is-medium">
    <div class="hero-body">
        <div class="container">
          <h1 class="title">
            Web Test Engine
          </h1>
          <h2 class="subtitle">
            {{ this.state }}
          </h2>
        </div>
      </div>
  </section>
</template>

<script>
import testStore from "stores/testStore.js";

export default {
  fromMobx: {
    testStore,
  },
};
</script>
