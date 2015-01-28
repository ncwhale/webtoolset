express = require 'express'
When = require 'when'
validator = require 'validator'

model = require '../models'
login = require '../actions/auth/login'
session = require '../actions/session'
body_parser = require '../actions/body_parser'

debug = require('debug')('route::register')
router = express.Router()

router.use [session, login.check]

#Router for view page.
router.get '/', (req, res, next)->
  model.User.find(req.session.user)
  .catch (err)->
    next err
  .then (user)->
    res.render 'profile',
      user: user
    return
  return

router.get '/:user_id', (req, res)->
  

router.post '/', [body_parser, (req, res)->
  # Sync Check From Data

  # and validator them
  form = req.body
  if !(validator.isEmail(form.user) and form.password?) 
    res.status(500).end() # "Bad form value"
    return
]

module.exports = router
module.exports.path = 'profile'
