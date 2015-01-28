# After this model loaded, req.session works.
session = require 'express-session'
RedisStore = require('connect-redis')(session)
config = require '../config'

session_config = {}

for k,v of config.session
  session_config[k] = v

session_config.cookie = config.cookie
session_config.store = new RedisStore config.redis

module.exports = session session_config
