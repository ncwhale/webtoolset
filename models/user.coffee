Sequelize = require 'sequelize'
Password = require '../actions/auth/password'
debug = require('debug')('Models::User')
User = (sequelize)->
  sequelize.define 'User',
    id:
      type:Sequelize.UUID
      unique: true
      allowNull: false
      defaultValue: Sequelize.UUIDV4
      primaryKey: true

    mail: # mail is also username, lowercase.
      type: Sequelize.STRING
      unique: true
      allowNull: false
      set: (v) ->
        @setDataValue 'mail', v.toLowerCase()

    salt: # salt will auto updated when create/password change.
      type: Sequelize.STRING.BINARY
      allowNull: false
      defaultValue: ()->
        Password.generate_salt [ Date.now() ]

      set: (v) ->
        debug 'Set Salt', v
        @setDataValue 'salt', Password.generate_salt (if v instanceof Array then v else [ v ])

    password: # already hashed password
      type: Sequelize.STRING
      allowNull: false      
      set: (v) ->
        debug 'Set Password', v
        @setDataValue 'password', Password.password_salt v, @getDataValue 'salt'
    
module.exports = User
