import axios from "axios";
import _ from "lodash";

const state = {
  currentUser: {},
  lastBadCredentials: {},
  jwtToken: null,
  unsuccessfulAttemptsNumber: 0,
};

const getters = {
  lastUsername: state => state.lastBadCredentials.username,
  lastPassword: state => state.lastBadCredentials.password,
  isAuthorized: state => !_.isEmpty(state.currentUser),
  isTeacher: (state, getters) => getters.userRole === "teacher",
  userRole: state => {
    if (_.isEmpty(state.currentUser)) return "guest";

    return state.currentUser.role;
  },
  username: state => state.currentUser.username,
  authHeader: state => {
    if (_.isEmpty(state.jwtToken)) return null;

    return { Authorization: `Bearer ${state.jwtToken}` };
  },
};

const mutations = {
  setAuthorizedUser(state, { userInfo, token }) {
    state.currentUser = userInfo;
    state.jwtToken = token;

    state.lastBadCredentials = {};
    state.unsuccessfulAttemptsNumber = 0;
  },
  setUncheckedCredentials(state, credentials) {
    state.lastBadCredentials = credentials;
  },
  clearAuthData(state) {
    state.currentUser = {};
    state.jwtToken = "";
  },
  incrementBadAttempts(state) {
    state.unsuccessfulAttemptsNumber++;
  },
};

const actions = {
  async authenticate({ state, commit }, credentials) {
    if (_.size(credentials) !== 2) return;

    commit("setUncheckedCredentials", credentials);
    commit("clearAuthData");

    const auth = credentials;
    try {
      const response = await axios.post("/user_token", { auth });
      const infoResponse = await axios.get("/api/users/current", {
        headers: { Authorization: `Bearer ${response.data.jwt}` },
      });
      commit("setAuthorizedUser", { userInfo: infoResponse.data.user, token: response.data.jwt });
    } catch (error) {
      commit("incrementBadAttempts");

      console.log(error);
    }
  },
  logout({ commit }) {
    commit("clearAuthData");
  },
};

export default {
  state,
  getters,
  mutations,
  actions,
};
