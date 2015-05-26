path    = require 'path'
webpack = require 'webpack'

prj_root  = path.resolve '.'
src_root  = 'src'
dest_root = 'dest'
uglify    = true
webpack   =
  entry: [ 'webpack-dev-server/client?http://localhost:9000', 'bootstrap' ],
  output:
    path: path.join(__dirname, dest_root),
    filename: 'bundle.js'
  module:
    loaders: [
      { test: /\.coffee$/, loader: 'coffee-loader' },
      { test: /\.styl$/, loader: 'style-loader!css-loader!stylus-loader' }
    ] 
  resolve:
    moduleDirectories: ['node_modules'],
    alias: 
      bootstrap: path.resolve src_root, 'bootstrap.coffee'
    extensions: ['', '.coffee', 'styl', '.js']

module.exports =
  prj_root: prj_root
  src_root: path.join prj_root, src_root
  dest_root: path.join prj_root, dest_root
  uglify: uglify
  webpack: webpack

