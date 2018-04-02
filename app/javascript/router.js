import Vue from "vue";
import Router from "vue-router";

import Home from "components/Home.vue";
import Users from "components/Users.vue";

Vue.use(Router);
const routes = [{ path: "/", component: Home }, { path: "/users", component: Users }];

export default new Router({ routes });
