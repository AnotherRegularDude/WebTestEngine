import client from "api/index.js";
import _ from "lodash";
import { observable, action, runInAction, computed } from "mobx";

class TestStore {
  @observable state = "done"; // Can be: done, pending, error
  @observable authHeader = {};
  @observable currentUser = {};

  @computed
  get isAuthorized() {
    return !_.isEmpty(this.authHeader);
  }

  @action.bound
  async authorizeWithCredentials(username, password) {
    const auth = { username, password };

    this.state = "pending";
    this.currentUser = {};

    try {
      const response = await client.post("/user_token", { auth });

      runInAction(() => {
        this.state = "done";
        this.currentUser = auth;
        this.authHeader.Authorization = `Bearer ${response.data.jwt}`;
      });

      _.assign(client.defaults.headers.common, this.authHeader);
    } catch (error) {
      runInAction(() => {
        this.state = "error";
      });
      console.log(error);
    }
  }
}

const testStore = new TestStore();
export default testStore;
