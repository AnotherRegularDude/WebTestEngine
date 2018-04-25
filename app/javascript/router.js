import Vue from "vue";
import Router from "vue-router";

import Home from "components/Home.vue";
import Students from "components/Students.vue";

Vue.use(Router);
const routes = [
  { path: "/", component: Home },
  { path: "/students", component: Students },
  { path: "/students/:page", component: Students },
];

export default new Router({ routes });
