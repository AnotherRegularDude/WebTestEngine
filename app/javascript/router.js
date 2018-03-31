import Vue from "vue";
import Router from "vue-router";

import Index from "components/Index.vue";
import About from "components/About.vue";

Vue.use(Router);
const routes = [{ path: "/", component: Index }, { path: "/about", component: About }];

export default new Router({ routes });
