gulp             = require('gulp-help')(require('gulp'))
util             = require 'gulp-util'
jade             = require 'gulp-jade'
gulpPlumber      = require 'gulp-plumber'
webpack          = require 'webpack'
webpackDevServer = require 'webpack-dev-server'
path             = require 'path'
# load project's settings.
settings         = require '../settings'

console.log settings.src_root
gulp.task 'jade', '', ->
  gulp.src settings.src_root + "/*.jade"
    .pipe gulpPlumber()
    .pipe jade {pretty:true}
    .pipe gulp.dest settings.dest_root

gulp.task 'run-dev-server', '', (callback) ->
  config = Object.create(settings.webpack)
  config.devtool = "eval"
  config.debug = true

  server = new webpackDevServer(webpack(config), {
    contentBase: settings.dest_root,
    stats: {colors: true},
    inline: true
  })

  server.listen 9000, (err) ->
    if err
      throw new util.PluginError 'webpack-dev-server', err
