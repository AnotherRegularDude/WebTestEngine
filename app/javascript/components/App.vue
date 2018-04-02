<template>
  <div id="app">
    <Header />
    <div id="app-content">
      <transition name="fade" :duration="700" mode="out-in">
        <router-view></router-view>
      </transition>
    </div>
    <Footer />
  </div>
</template>

<script>
import Header from "components/common/Header.vue";
import Footer from "components/common/Footer.vue";

export default {
  components: { Header, Footer },
};
</script>

<style>
#app {
  display: flex;
  min-height: 100vh;
  flex-direction: column;
}

#app-content {
  flex: 1;
}
</style>
