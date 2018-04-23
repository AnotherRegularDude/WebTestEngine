import "mdi/css/materialdesignicons.css";
import "buefy/lib/buefy.css";
import "src/theme.min.css";
import "vue2-animate/dist/vue2-animate.min.css";

import lodash from "lodash";
import Vue from "vue";
import Buefy from "buefy";
import router from "router.js";
import store from "store/index.js";
import { setDefaultsForAxios } from "api/index.js";
import App from "components/App.vue";

Vue.use(Buefy);
Vue.use(require("vue-shortkey"));

Object.defineProperty(Vue.prototype, "$lodash", { value: lodash });
setDefaultsForAxios();

document.addEventListener("DOMContentLoaded", () => {
  const el = document.body.appendChild(document.createElement("app"));
  const app = new Vue({
    el,
    store,
    router,
    render: h => h(App),
  });
  console.log(app);

  const navbarBurgers = Array.prototype.slice.call(document.querySelectorAll(".navbar-burger"), 0);
  if (navbarBurgers.length > 0) {
    navbarBurgers.forEach(function(el) {
      el.addEventListener("click", function() {
        const target = el.dataset.target;
        const $target = document.getElementById(target);

        el.classList.toggle("is-active");
        $target.classList.toggle("is-active");
      });
    });
  }
});
