const webpack = require('webpack');

module.exports = function(config) {
  config.set({
    basePath: '',
    frameworks: ['mocha','chai','riot'],
    plugins: [
      'karma-mocha',
      'karma-mocha-reporter',
      'karma-phantomjs-launcher',
      'karma-chai',
      'karma-webpack',
      'karma-riot'
    ],
    files: [
      'tests.webpack.js'
    ],
    preprocessors: {
      'tests.webpack.js': ['webpack']
    },
    browsers: ['PhantomJS'],
    reporters: ['mocha'],
    failOnEmptyTestSuite: false,
    singleRun: true,
    webpack: {
      plugins: [
        new webpack.ProvidePlugin({
          riot: 'riot'
        }),
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
            loader: 'style-loader!css-loader?modules&importLoaders=1&localIdentName=[name]__[hash:base64:5]!sass-loader'
          }
        ]
      },
    }
  })
}
