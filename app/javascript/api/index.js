import axios from "axios";

const axiosInstance = axios.create({
  baseURL: "http://localhost:3000",
  timeout: 2500,
  withCredentials: true,
  headers: {
    "Access-Control-Allow-Origin": "*",
  },
});

export default axiosInstance;
