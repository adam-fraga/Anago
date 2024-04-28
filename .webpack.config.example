const path = require("path"); // Node Js module path management
const CleanWebpackPlugin = require("clean-webpack-plugin").CleanWebpackPlugin;
const HtmlWebpackPlugin = require("html-webpack-plugin");

module.exports = {
  devtool: "eval-source-map", //Provide debug in inspector in source file and not tidious readable bundle.js file (add source map in tsconfig file)
  entry: "./src/scripts/index.ts", //Entrypoint for webpack compiler
  module: {
    rules: [
      {
        test: /\.ts$/,
        use: "ts-loader",
        include: [path.resolve(__dirname, "src/scripts")],
        exclude: /node_modules/,
      },
    ],
  },
  resolve: {
    extensions: ["js", "ts"],
  },
  output: {
    publicPath: "assets", // Specify the folder for webpack dev server to reload properly
    filename: "bundle.js", // Name of the outputed file after compile
    path: path.resolve(__dirname, "assets/scripts"), // Abs path for the outputed file
  },
  plugins: [
    new CleanWebpackPlugin(),
    new HtmlWebpackPlugin({
      title: "Output Management",
    }),
  ],
};
