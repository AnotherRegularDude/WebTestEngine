<template>
  <div id="app">
    <Header />
    <router-view></router-view>
    <Footer />
  </div>
</template>

<script>
import Header from "components/common/Header.vue";
import Footer from "components/common/Footer.vue";

export default {
  data: function() {
    return {};
  },
  components: { Header, Footer },
};
</script>

<style>
p {
  font-size: 15pt;
}
.fade-enter-active {
  animation: fade-in 0.15s;
}
.fade-leave-active {
  animation: fade-in 0.15s reverse;
}
@keyframes fade-in {
  0% {
    opacity: 0;
  }
  50% {
    opacity: 0.5;
  }
  100% {
    opacity: 1;
  }
}
</style>
