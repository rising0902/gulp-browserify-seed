gulp             = require('gulp-help')(require('gulp'))
coffee           = require 'gulp-coffee'
requireDir       = require 'require-dir'
path             = require 'path'
# load project's settings.
settings         = require './gulp/settings'
requireDir './gulp/tasks', { recurse: true }

gulp.task 'default', 'Default task.', ['jade', 'run-dev-server']
