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
          <router-link class="navbar-item" active-class="is-active" to="/users">Users</router-link>
        </div>
        <div class="navbar-end">
          <div class="navbar-item">
            <p class="field">
              <button v-show="!isAuthorized" class="button is-info" @click="isModalActive = true">Login</button>
              <button v-show="isAuthorized" class="button is-info" @click="logout">Logout</button>

              <b-modal :active.sync="isModalActive" has-modal-card>
                <keep-alive>
                  <ModalLogin @close="isModalActive = false" />
                </keep-alive>
              </b-modal>
            </p>
          </div>
        </div>
      </div>
    </nav>
</template>

<script>
import ModalLogin from "components/common/ModalLogin.vue";
import { mapGetters, mapActions } from "vuex";
import logoImg from "src/images/logo.png";

export default {
  data() {
    return {
      logoImg,
      isModalActive: false,
    };
  },
  computed: {
    ...mapGetters(["isAuthorized"]),
  },
  methods: {
    ...mapActions(["logout"]),
  },
  components: {
    ModalLogin,
  }
};
</script>
<style>
.rounder-image {
  border-radius: 20px;
  border-style: inset;
}
</style>
