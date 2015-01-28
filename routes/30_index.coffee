express = require 'express'

debug = require('debug')('route::index')
router = express.Router()

router.get '/', (req, res)->
  res.render 'index'
  return

module.exports = router
