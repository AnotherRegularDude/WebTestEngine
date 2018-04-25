<template>
  <div class="container is-fluid main-padding">
    <div class="columns">
      <div class="column" v-for="user in users" :key="user.id">
        <div class="box">
          <article class="media">
            <div class="media-content">
              <div class="content">
                <div class="field is-grouped is-grouped-multiline">
                  <div class="control">
                    <div class="tags has-addons is-marginless">
                      <span class="tag">Активный</span>
                      <span class="tag is-info">{{ user.activated.toString() }}</span>
                    </div>
                  </div>
                  <div class="control">
                    <div class="tags has-addons is-marginless">
                      <span class="tag">Выполняет тест</span>
                      <span class="tag is-info">false</span>
                    </div>
                  </div>
                  <div class="control">
                    <div class="tags has-addons is-marginless">
                      <span class="tag">Пройденные тесты</span>
                      <span class="tag is-info">5</span>
                    </div>
                  </div>
                </div>
                <p>
                  <strong>Общая информация:</strong> {{ user.username }} <small>{{ user.email }}</small>
                  <br>
                  <strong>ФИО:</strong> {{ user.full_name }}
                  <br>
                </p>
              </div>
              <nav class="level is-mobile">
                <div class="level-left"></div>
                <div class="level-right">
                  <a class="level-item" aria-label="reply">Подробная статистика</a>
                </div>
              </nav>
            </div>
          </article>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import { mapGetters } from "vuex";

export default {
  data() {
    return {
      users: [],
    };
  },
  computed: {
    ...mapGetters(["authHeader"]),
  },
  created() {
    this.getUsers(1);
  },
  methods: {
    async getUsers(page) {
      try {
        const response = await axios.get("/api/users", {
          headers: { ...this.authHeader },
          params: { role: "student", page },
        });

        this.users = response.data.data;
      } catch (error) {
        console.log(error);
        this.users = [];
      }
    },
  },
};
</script>

<style>
.main-padding {
  padding-top: 30px;
  padding-bottom: 30px;
}
</style>
