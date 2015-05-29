gulp       = require('gulp-help')(require('gulp'))
browserify = require 'browserify'
source     = require 'vinyl-source-stream'
buffer     = require 'vinyl-buffer'
plumber    = require 'gulp-plumber'
util       = require 'gulp-util'
uglify     = require 'gulp-uglify'
watchify   = require 'watchify'
assign     = require 'lodash.assign'
sourcemaps = require 'gulp-sourcemaps'
connect    = require 'gulp-connect'
# load project's settings.
settings         = require '../settings'

#gulp.task 'coffee', '', ->
#    browserify
#      entries: ['./src/bootstrap.coffee']
#      transform: ['coffeeify']
#      extensions: ['.coffee']
#      debug: true
#    .bundle()
#    .pipe source 'bundle.js'
#    .pipe gulp.dest settings.dest_root

#watching = false
#gulp.task 'enable-watch-mode', ->
#  watching = true

#gulp.task 'browserifya', watchify (watchify) ->
#  gulp.src 'lib/index.js'
#    .pipe watchify
#      watch: watching
#    .pipe gulp.dest settings.dest_root + '/bundle.js'
#
#gulp.task 'watchify', ['enable-watch-mode', 'browserifya']
#
#gulp.task 'watch', ['build', 'enable-watch-mode', 'watchify'], ->
#  gulp.watch 'src/**/*.coffee', ['build:coffee']

gulp.task 'compile', '', ->

  browserifyOption =
    entries: ['./src/bootstrap.coffee']
    transform: ['coffeeify']
    extensions: ['.coffee']
    debug: true

  opts = assign {}, watchify.args, browserifyOption

  bundler = watchify browserify 'src/bootstrap.coffee', opts
#  console.log Object.keys(a)
#  bundler = watchify a
#  bundler = watchify browserify './src/bootstrap.coffee', option

# bundler = browserify( config.src, config.browserify );

  bundle = ->
    return bundler
      .bundle()
      .on 'error', util.log.bind(util, 'Browserify Error')
      .pipe source 'bundle.js'
      .pipe buffer()
      .pipe sourcemaps.init { loadMaps: true }
      .pipe uglify()
      .pipe sourcemaps.write '.'
      .pipe gulp.dest settings.dest_root
 
  bundler.on('update', bundle)
  bundler.on 'log', util.log
 
  bundle()

gulp.task 'server', ->
  connect.server
    root: settings.dest_root
    port: 8080
    livereload: true
