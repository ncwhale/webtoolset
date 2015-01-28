express = require "express"
debug = require('debug')('app');

debug 'App init.'

config = require './config'

app = express()

# load settings 
for k,v of config.express
  app.set k, v

# env setup
if !(app.get 'env')
  app.set 'env', if config.develop? then 'development' else 'production'

# made some change when used in production(May delete?
if app.get 'env' == 'production'
  config.session.secure = true
  app.set 'trust proxy', 'loopback' unless app.get 'trust proxy'

# pre load models
models = require './models'

# load routes
routes = require './routes'
app.use routes

module.exports = app

debug 'App loaded.'
