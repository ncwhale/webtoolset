debug = require('debug')('route::404_not_found')

handler_404 = (req, res, next) ->
  # debug req.url
  err = new Error("Request #{req.url} not found")
  err.status = 404
  next err
  return

module.exports = handler_404
