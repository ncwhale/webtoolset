Password = require './password'
Models = require '../../models'

debug = require('debug')('action::login')

login = (mail, password, req)->
  Models.User.find(
    where:
      mail: mail.toLowerCase()
  ).then (user)->
    if user? and Password.password_salt(password, user.salt) == user.password
      # Success return user id (or user object?
      req.session.user = user.id
      user
    else
      null

logout = (req)->
  delete req.session.user

check_error = (req, res, next)->
  if req.session?.user?
    next()
  else
    err = new Error 'Not authed.'
    next err

check_redirect = (options = {})->
  if options.fail_redirect?
    return (req, res, next)->
      if req.session?.user?
        next()
      else
        res.redirect options.fail_redirect
  else
    return check_error

#default auth check function
check = check_redirect { fail_redirect : '/login' }

module.exports =
  login : login
  check : check
  check_error : check_error
  check_redirect : check_redirect
