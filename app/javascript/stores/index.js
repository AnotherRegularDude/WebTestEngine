import Vue from "vue";
import { observable, isObservable, toJS, configure } from "mobx";
import VueMobx from "vue-mobx";

Vue.use(VueMobx, {
  toJS: toJS, // must
  isObservable: isObservable, // must
  observable: observable, // optional
});
