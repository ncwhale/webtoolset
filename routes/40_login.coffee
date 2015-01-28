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
  req.session.ip = req.ip

  res.render 'login',
    IP: req.ip
  return

router.post '/', [body_parser, (req, res)->
  # Sync Check From Data
  if !req.session.ip? or req.session.ip != req.ip or !req.body?
    res.status(500).end()
    return

  # and validator them
  form = req.body
  if !(validator.isEmail(form.user) and form.password?) 
    res.status(500).end() # "Bad form value"
    return

  login.login(form.user, form.password, req).then (user)->
    if user?
      if req.session?.login_redirect?
        res.redirect req.session.login_redirect
      else
        res.status(200).end()
    else
      res.status(500).end() # "Login failed."

  return
]

module.exports = router
module.exports.path = 'login'
