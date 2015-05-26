gulp         = require('gulp-help')(require('gulp'))
uglify       = require 'gulp-uglify'
gulpIf       = require 'gulp-if'
webpack      = require 'gulp-webpack'
# load project's settings.
settings     = require '../settings'

gulp.task 'package', '', ->
  gulp.src settings.webpack.entry
    .pipe webpack settings.webpack
    .pipe gulpIf settings.uglify, uglify()
    .pipe gulp.dest settings.dest_root
