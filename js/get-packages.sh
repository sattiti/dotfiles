#!/usr/bin/env bash

packages=(
@babel/core
@babel/plugin-syntax-dynamic-import
@babel/plugin-transform-modules-commonjs
@babel/plugin-transform-react-jsx
@babel/plugin-transform-runtime
@babel/plugin-transform-strict-mode
@babel/plugin-transform-typescript
@babel/preset-env
@babel/preset-react
@babel/preset-typescript
@mdi/font
@mdi/js
@storybook/addon-a11y
@storybook/addon-actions
@storybook/addon-console
@storybook/addon-cssresources
@storybook/addon-design-assets
@storybook/addon-docs
@storybook/addon-essentials
@storybook/addon-links
@storybook/addons
@storybook/cli
@storybook/html
@storybook/theming
@types/babel-plugin-react-pug
@types/eslint
@types/jest
@types/lodash
@types/node
@types/pug
@types/react
@types/react-dom
@types/recoil
@typescript-ealint/eslint-plugin
@typescript-ealint/parser
@webpack-cli/init
@whitespace/storybook-addon-html
acorn
alasql
axios
babel-jest
babel-loader
babel-plugin-transform-react-jsx
babel-plugin-transform-react-pug
babel-preset-jest
core-js
css-loader
deepmerge
dotenv
dotenv-webpack
eslint
eslint-config-prettier
eslint-config-standard
eslint-loader
eslint-plugin-eslint-comments
eslint-plugin-import
eslint-plugin-node
eslint-plugin-prettier
eslint-plugin-promise
eslint-plugin-react
eslint-plugin-react-hooks
eslint-plugin-react-pug
eslint-plugin-standard
eslint-plugin-vue
fiber
fibers
file-loader
hard-source-webpack-plugin
html-loader
html-webpack-plugin
jest
jest-extended
js-yaml
lodash
material-design-icons-iconfont
mobx
mobx-react
npm-run-all
papaparse
prettier
pug
pug-cli2
pug-loader
pug-plain-loader
raw-loader
react
react-dom
recoil
regenerator-runtime
resolve-url-loader
sass
sass-loader
style-loader
terser-webpack-plugin
ts-jest
ts-loader
ts-node
typescript
url-loader
velocity-animate
vue
vue-cli-plugin-vuetify
vue-loader
vue-router
vue-style-loader
vue-template-compiler
vuetify
vuetify-loader
vuex
webpack
webpack-cli
webpack-dev-middleware
webpack-dev-server
)

for p in ${packages[@]}; do
npm i -D $p
done
