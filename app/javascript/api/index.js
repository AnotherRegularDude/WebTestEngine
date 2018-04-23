import axios from "axios";

const setDefaultsForAxios = () => {
  axios.defaults.baseURL = "http://localhost:3000";
  axios.defaults.withCredentials = true;
  axios.defaults.headers.common["Access-Control-Allow-Origin"] = "*";
};

export { setDefaultsForAxios };
