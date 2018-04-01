<template>
  <section class="section">
    <div class="modal-card">
      <header class="modal-card-head">
        <p class="modal-card-title">Авторизация</p>
        <button class="delete" aria-label="close" @click="$emit('close')"></button>
      </header>
      <section class="modal-card-body">
        <b-field label="Имя пользователя">
          <b-input
              type="text"
              v-model="username"
              placeholder="Your username"
              required>
          </b-input>
        </b-field>
        <b-field label="Пароль">
          <b-input
              type="password"
              v-model="password"
              placeholder="Your password"
              required>
          </b-input>
        </b-field>
      </section>
      <footer class="modal-card-foot">
        <button class="button is-success" @click="onLoginClick">Login</button>
        <button class="button" @click="$emit('close')">Close</button>
      </footer>
    </div>
  </section>
</template>

<script>
import testStore from "stores/testStore.js";
import _ from "lodash";

export default {
  data() {
    return {
      username: "",
      password: "",
    };
  },
  fromMobx: {
    testStore,
  },
  beforeMount() {
    _.assign(this, this.currentUser);
  },
  methods: {
    onLoginClick() {
      this.$emit("login", {
        username: this.username,
        password: this.password,
      });
    },
  },
};
</script>
