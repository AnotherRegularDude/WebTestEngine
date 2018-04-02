const { dev_server: devServer } = require("@rails/webpacker").config;

const isProduction = process.env.NODE_ENV === "production";
const inDevServer = process.argv.find(v => v.includes("webpack-dev-server"));
const extractCSS = !(inDevServer && (devServer && devServer.hmr)) || isProduction;

module.exports = {
  test: /\.vue(\.erb)?$/,
  use: [
    {
      loader: "vue-loader",
      options: {
        postcss: [
          require("postcss-import")(),
          require("postcss-import")({}),
          require("postcss-cssnext")({
            features: {
              customProperties: { warnings: false },
            },
          }),
          // require("precss")({}),
        ],
      },
    },
  ],
};
