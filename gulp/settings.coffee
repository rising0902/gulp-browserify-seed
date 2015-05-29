path    = require 'path'

prj_root  = path.resolve '.'
src_root  = 'src'
dest_root = 'dest'

module.exports =
  prj_root: prj_root
  src_root: path.join prj_root, src_root
  dest_root: path.join prj_root, dest_root

