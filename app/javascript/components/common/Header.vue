<template>
    <nav class="navbar is-primary" role="navigation" aria-label="main navigation">
      <div class="navbar-brand">
        <router-link class="navbar-item" :exact="true" to="/">
          <img :src="logoImg" alt="Logo of site">
        </router-link>
        <div class="navbar-burger" data-target="mainNav">
          <span></span>
          <span></span>
          <span></span>
        </div>
      </div>
      <div class="navbar-menu" id="mainNav">
        <div class="navbar-start">
          <router-link class="navbar-item" active-class="is-active" :exact="true" to="/">Home</router-link>
          <router-link class="navbar-item" active-class="is-active" to="/about">About</router-link>
        </div>
        <div class="navbar-end">
          <div class="navbar-item">
            <p class="field">
              <button class="button is-info" :class="{ 'is-loading': isPending }" @click="isModalActive = true">Login</button>

              <b-modal :active.sync="isModalActive" has-modal-card>
                <ModalLogin @close="isModalActive = false" @login="onLogin" />
              </b-modal>
            </p>
          </div>
        </div>
      </div>
    </nav>
</template>

<script>
import testStore from "stores/testStore.js";
import ModalLogin from "components/common/ModalLogin.vue";
import logoImg from "assets/images/logo.png";

export default {
  data() {
    return {
      logoImg,
      isModalActive: false,
    };
  },
  fromMobx: {
    testStore,
  },
  computed: {
    isPending() {
      return this.state === "pending";
    },
  },
  methods: {
    onLogin: function({ username, password }) {
      this.isModalActive = false;

      this.authorizeWithCredentials(username, password);
    },
  },
  components: {
    ModalLogin,
  },
};
</script>
