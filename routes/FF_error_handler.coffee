# Last route for error handle
config = require '../config'
debug = require('debug')('route::error_handler')

if config.develop?
  handler_error = (err, req, res, next)->
    debug err.message
    err.status ?= 500
    res.status(err.status).render 'error',
      message: err.message
      status: err.status
      stack: err.stack
    return
else
  handler_error = (err, req, res, next)->
    debug err.message
    res.status(204).end()
    return

module.exports = handler_error
