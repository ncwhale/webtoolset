crypto = require 'crypto'

#salt function
generate_salt = (info...)->
  hash = crypto.createHash 'sha256'
  hash.update crypto.randomBytes 128
  hash.update "#{i}" for i in info
  Buffer.concat [crypto.randomBytes(32), hash.digest()]

password_salt = (password, salt) ->
  hash = crypto.createHash 'sha256'
  hash.update salt
  hash.update "#{password}"
  hash.digest('hex')

module.exports =
  generate_salt : generate_salt
  password_salt : password_salt
