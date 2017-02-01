const path = require('path');
const webpack = require('webpack');
let ExtractTextPlugin = require('extract-text-webpack-plugin');

const BUILD_DIR = path.resolve(__dirname, 'public');
const APP_DIR = path.resolve(__dirname, 'client');
const PUBLIC_DIR = path.resolve(__dirname, 'public');
 
let extractCSS = new ExtractTextPlugin('styles.css');

module.exports = {
  context: APP_DIR,
  entry: './index',
  output: {
    path: BUILD_DIR,
    filename: 'bundle.js'
  },
  resolve: {
    extensions: ['', '.js', '.json'],
    root: [
      APP_DIR
    ],
    modulesDirectories: [
      path.resolve(__dirname, './node_modules'),
    ]
  },
  plugins: [
    new webpack.ProvidePlugin({
      riot: 'riot'
    }),
    extractCSS
  ],
  module: {
    preLoaders: [
      { test: /\.tag$/,
        exclude: /node_modules/,
        loader: 'riotjs-loader', query: { type: 'none' }
      }
    ],
    loaders: [
      { test: /\.js$|\.tag$/,
        exclude: /node_modules/,
        loader: 'babel-loader'
      },
      {
        test: /\.s?css$/,
        loader: extractCSS.extract('style-loader', 
          'css-loader?modules&importLoaders=1&localIdentName=[name]__[hash:base64:5]!sass-loader')
      }
    ]
  },
  devServer: {
    contentBase: './public'
  }
};
