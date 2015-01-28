#models/index.coffee
fs = require 'fs'
path = require 'path'
sequelize = require '../actions/sequelize_connect'

debug = require('debug')('app::model')

models = {}
selfname = path.basename __filename

fs
  .readdirSync(__dirname)
  .filter (file)->
    (file.indexOf('.') != 0) && (file != selfname)
  .forEach (file)->
    try
      model = require path.join __dirname, file
      smodel = model sequelize
      models[smodel.name] = model
      debug "Loaded model: #{smodel.name}"
    catch e
      debug "Load #{file} error: #{e}" 

# After load models, execute the after load trigger.
for key of sequelize.models
  debug key, models[key].postInit
  models[key].postInit? sequelize.models

module.exports = sequelize.models
module.exports.sequelize = sequelize
