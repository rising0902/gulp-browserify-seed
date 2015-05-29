gulp             = require('gulp-help')(require('gulp'))
requireDir       = require 'require-dir'

# load project's settings.
settings         = require './gulp/settings'

requireDir './gulp/tasks', { recurse: true }

gulp.task 'default', 'Default task.', ['compile', 'server']
