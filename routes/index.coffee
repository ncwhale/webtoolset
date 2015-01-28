#routes/index.coffee
# Route load rules:
# 1. Do not load file/path name begin with .-_#~
# 2. Order by name
# 3. If exists path, bind with path.

fs = require 'fs'
path = require 'path'
express = require("express")
debug = require('debug')('app::route')

router = express.Router
  caseSensitive: true
  
selfname = path.basename __filename
filter_regexp = /^[^\.\-_#~]/i

fs
  .readdirSync(__dirname)
  .filter (file)->
    (filter_regexp.test file) && (file != selfname)
  .sort()
  .forEach (file)->
    try
      # debug "Try load route:#{file}"
      model = require path.join __dirname, file
      if model.path
        router.use '/' + model.path, model
      else
        router.use model
      debug "Loaded route: #{model.path ? file}"
    catch e
      debug "Load #{file} error: #{e}" 

module.exports = router
