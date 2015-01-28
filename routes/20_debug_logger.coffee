morgan = require("morgan")
config = require '../config'
debug = require('debug')('route::debug_log')

if config.develop
  logger = (req, res, next) ->
    debug "#{req.ip} #{req.method} #{req.url}"
    next()
    return
else
  logger = morgan(config.logger ? 'dev')

module.exports = logger
