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
        <button class="button is-success" v-shortkey.once="['enter']" @shortkey="onLoginClick" @click.once="onLoginClick">Login</button>
        <button class="button" @click="$emit('close')">Close</button>
      </footer>
    </div>
  </section>
</template>

<script>
import { mapGetters, mapActions } from "vuex";

export default {
  data() {
    return {
      username: "",
      password: "",
    };
  },
  computed: {
    ...mapGetters(["lastUsername", "lastPassword"]),
  },
  activated() {
    this.username = this.lastUsername;
    this.password = this.lastPassword;
  },
  methods: {
    ...mapActions(["authenticate"]),
    onLoginClick() {
      this.$emit("close");

      this.authenticate({ username: this.username, password: this.password });
    },
  },
};
</script>
