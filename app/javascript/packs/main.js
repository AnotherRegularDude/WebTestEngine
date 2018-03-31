import "main-sass";
import "mdi/css/materialdesignicons.css";

import Vue from "vue";
import Buefy from "buefy";

import router from "router.js";
import App from "components/App.vue";

Vue.use(Buefy);

document.addEventListener("DOMContentLoaded", () => {
  const el = document.body.appendChild(document.createElement("app"));
  const app = new Vue({
    el,
    router,
    render: h => h(App),
  });

  console.log(app);
});
