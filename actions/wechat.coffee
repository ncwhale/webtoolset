# Wechat Actions.
wechat = require 'wechat'
config = require '../config'
redis = require 'then-redis'
cache = redis.createClient()

util = require 'util'
debug = require('debug')('action::wechat')

API = new wechat.API config.wechat.appid, config.wechat.appsecret, (callback)->
  # Read token from global.
  debug()
  cache.hgetall("token_#{config.wechat.id}").then (token)->
    debug "Get token:#{util.inspect token}"
    callback null, token
  .catch (err)->
    debug.error "Get token error: #{util.inspect err}"
    callback err, null
, (token, callback) ->
  # Save token to global.
  debug()
  cache.hmset("token_#{config.wechat.id}", token).then ()->
    debug "Save token:#{util.inspect token}"
    callback null
  .catch (err)->
    debug.error "Save token error: #{util.inspect err}"
    callback err

# Can add more actions for api here.

module.exports = API