Sequelize = require('sequelize')
config = require '../config'

sequelize = new Sequelize config.sequelize.database,
  config.sequelize.username ? null,
  config.sequelize.password ? null,
  config.sequelize

module.exports = sequelize
