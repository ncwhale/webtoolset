express = require 'express'
When = require 'when'
validator = require 'validator'

model = require '../models'
login = require '../actions/auth/login'
session = require '../actions/session'
body_parser = require '../actions/body_parser'

debug = require('debug')('route::register')
router = express.Router()

router.use session

#Router for view page.
router.get '/', (req, res)->
  res.render 'hterm'

module.exports = router
module.exports.path = 'term'
