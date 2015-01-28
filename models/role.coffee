Sequelize = require 'sequelize'
debug = require('debug')('model::role')

Role = (sequelize)->
  sequelize.define 'Role',
    id:
      type: Sequelize.UUID
      unique: true
      allowNull: false
      defaultValue: Sequelize.UUIDV4
      primaryKey: true
    rule:
      type: Sequelize.STRING

postInit = (models)->
  models.Role.belongsTo models.User
  models.User.hasMany models.Role
  return

module.exports = Role
module.exports.postInit = postInit
