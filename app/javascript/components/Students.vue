<template>
  <div class="container is-fluid main-padding">
    <div class="columns is-multiline is-mobile" id="container">
      <div class="column is-narrow" v-for="user in users" :key="user.id">
        <div class="box">
          <article class="media">
            <div class="media-content">
              <div class="content">
                <div class="field is-grouped">
                  <div class="control">
                    <div class="tags has-addons is-marginless">
                      <span class="tag is-size-7">Активный</span>
                      <span class="tag is-info is-size-7">{{ user.activated.toString() }}</span>
                    </div>
                  </div>
                  <div class="control">
                    <div class="tags has-addons is-marginless">
                      <span class="tag is-size-7">Выполняет тест</span>
                      <span class="tag is-info is-size-7">false</span>
                    </div>
                  </div>
                  <div class="control">
                    <div class="tags has-addons is-marginless">
                      <span class="tag is-size-7">Пройденные тесты</span>
                      <span class="tag is-info is-size-7">5</span>
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
    <section class="section">
      <b-pagination
        :total="totalCount"
        :current.sync="currentPage"
        :per-page="15"
        order="is-centered"
        @change="newPage => getUsers(newPage)"
      />
    </section>
  </div>
</template>

<script>
import axios from "axios";
import { mapGetters } from "vuex";

export default {
  data() {
    const currentPage = parseInt(this.$route.params.page || 1);

    return {
      currentPage,
      totalCount: 0,
      users: [],
    };
  },
  computed: {
    ...mapGetters(["authHeader"]),
  },
  created() {
    this.getUsers(this.currentPage);
  },
  methods: {
    async getUsers(page) {
      this.users = [];

      try {
        const response = await axios.get("/api/users", {
          headers: { ...this.authHeader },
          params: { role: "student", page },
        });

        this.users = response.data.data;
        this.totalCount = response.data.meta.total_count;
        this.$el.querySelector("#container").scrollIntoView();
      } catch (error) {
        console.log(error);
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
