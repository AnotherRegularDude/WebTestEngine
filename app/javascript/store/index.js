import Vue from "vue";
import Vuex from "vuex";
import createPersistedState from "vuex-persistedstate";

import authModule from "./modules/authenticator.js";

Vue.use(Vuex);
const debug = process.env.NODE_ENV !== "production";
const store = new Vuex.Store({
  modules: {
    authModule,
  },
  strict: debug,
  plugins: [createPersistedState()],
});

export default store;
