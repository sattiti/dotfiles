const path = require('path');
const webpack = require('webpack')
const TerserPlugin = require('terser-webpack-plugin')
const VueLoaderPlugin = require('vue-loader/lib/plugin')
// const HtmlWebpackPlugin   = require('html-webpack-plugin');

const mode = 'production' // 'development'

module.exports = {
  cache: false,
  stats: 'errors-warnings',

  watchOptions: {
    aggregateTimeout: 300,
    poll: 500,
  },

  performance: {
    hints: false,
    maxEntrypointSize: 512000,
    maxAssetSize: 512000
  },

  // production, development, none
  mode: mode,

  // target: 'node',

  entry: [
    'core-js/stable',
    'regenerator-runtime/runtime',
    path.resolve(__dirname, 'src/js/main.js'),
  ],

  output: {
    filename: '[name].js',
    publicPath: '/js/',
    path: path.resolve(__dirname, '../static/js')
  },

  plugins: [
    new webpack.ProgressPlugin(),
    new VueLoaderPlugin(),
    // new HtmlWebpackPlugin(),
  ],

  module: {
    rules: [
      {
        test: /\.vue$/,
        loader: 'vue-loader',
        options: {
          optimizeSSR: false,
          cssSourceMap: false,
        }
      },
      {
        test: /\.pug$/,
        oneOf:[
          {
            resourceQuery: /^\?vue/,
            use: ['pug-plain-loader']
          },
          {
            use: ['raw-loader', 'pug-plain-loader', 'vue-template-loader']
          }
        ]
      },
      {
        test: /\.css$/,
        use: [
          'style-loader',
          'css-loader',
        ]
      },
      {
        test: /\.(sass|scss)$/,
        use: [
          'vue-style-loader',
          'css-loader',
          {
            loader: 'sass-loader',
            options: {
              implementation: require('sass'),
              sassOptions: {
                // fiber: require('fibers'),
                indentedSyntax: true,
                outputStyle: 'compressed',
                sourceMap: false
              }
            }
          }
        ]
      },
      {
        test: /\.(jpg|jpeg|gif|png|json|svg)$/,
        loader: 'url-loader'
      },
      {
        test: /\.m?(js|jsx)$/,
        exclude: /node_modules/,
        enforce: 'pre',
        loader: 'eslint-loader',
        options: {
          cache: false,
          fix: false
        }
      },
      {
        test: /\.m?(js|jsx)$/,
        exclude: /node_modules/,
        // include: [],
        loader: 'babel-loader',
        options: {
          plugins: [
            '@babel/plugin-syntax-dynamic-import',
            '@babel/plugin-transform-runtime',
          ],
          presets: [
            [
              '@babel/preset-env',
              {
                useBuiltIns: 'entry',
                corejs: 3,
              },
            ]
          ]
        }
      }
    ]
  },

  resolve: {
    extensions: [
      '*',
      '.js',
      '.json',
      '.vue',
      '.jsx'
    ],
    alias: {
      vue$: 'vue/dist/vue.esm.js',
    }
  },

  optimization: {
    // Tell webpack to minimize the bundle using the TerserPlugin.
    minimize: true,

    minimizer: [
      new TerserPlugin({
        test: /\.js(\?.*)?$/i,
        terserOptions: {
          format: {
            comments: false,
          },
        },
        extractComments: false,
      }),
    ],

    removeAvailableModules: true,
  },

  devServer: {
    bonjour: true,
    compress: true,
    contentBase: path.join(__dirname, '/output'),
    hot: true,
    inline: true,
    liveReload: true,
    open: true,
    port: 4000,
    watchContentBase: true
  }
};

