const fs = require("fs");
const path = require("path");
const _ = require("lodash");
const nodeExternals = require("webpack-node-externals");
const ForkTsCheckerWebpackPlugin = require("fork-ts-checker-webpack-plugin");
const CopyWebpackPlugin = require("copy-webpack-plugin");
const packageJson = require("./package.json");
// const packageJsonTools = require('./tools/package.json');

const filterProperties = new Set([
  "description",
  "devDependencies",
  "homepage",
  "license",
  // "scripts",
]);

/**
 * @see https://webpack.js.org/configuration/mode/#mode-none
 * @see https://webpack.js.org/guides/typescript/
 * @see https://webpack.js.org/guides/build-performance/
 * @see https://github.com/TypeStrong/fork-ts-checker-webpack-plugin
 * @see https://github.com/TypeStrong/ts-loader#transpileonly
 */
module.exports = (env, argv) => {
  return {
    cache: {
      type: "filesystem",
      buildDependencies: {
        // This makes all dependencies of this file - build dependencies
        config: [__filename],
        // By default webpack and loaders are build dependencies
      },
    },
    devtool: argv.mode === "development" ? "eval" : false,
    entry: {
      app: "./bin/www.ts",
    },
    externals: [nodeExternals()],
    externalsPresets: { node: true },
    module: {
      rules: [
        {
          test: /\.tsx?$/,
          loader: "ts-loader",
        },
      ],
    }, // in order to ignore built-in modules like path, fs, etc.
    node: {
      // Need this when working with express, otherwise the build fails
      __dirname: false, // if you don't put this is, __dirname
      __filename: false, // and __filename return blank or /
    }, // in order to ignore all modules in node_modules folder,
    output: {
      filename: "[name].bundle.js",
    },
    plugins: [
      new ForkTsCheckerWebpackPlugin(),
      new CopyWebpackPlugin({
        patterns: [
          { from: "views", to: "views" },
          { from: path.join(__dirname, "public", "favicon.ico"), to: "public" },
          "pm2.config.yml",
        ],
      }),
      {
        apply: (compiler) => {
          compiler.hooks.compile.tap("package.json", () => {
            const mergedJson = JSON.stringify(
              _.merge(packageJson /*packageJsonTools*/),
              (k, v) => (v == null || filterProperties.has(k) ? undefined : v),
              2
            );
            fs.writeFileSync(
              path.resolve(__dirname, "dist", "package.json"),
              mergedJson
            );
          });
        },
      },
    ],
    resolve: {
      symlinks: false,
      extensions: [".tsx", ".ts", ".js"],
    },
    target: "node18",
    watchOptions: {
      aggregateTimeout: 1000,
      ignored: ["public", "sql", "node_modules"],
    },
  };
};
