#Static files route.
# All static files and stylus files are put in public directory.

path = require 'path'
stylus = require 'stylus'
express = require 'express'
debug = require('debug')('route::static');

router = express.Router()

router.use stylus.middleware(path.join(__dirname , '../public'))
router.use express.static(path.join(__dirname, "../public"))

module.exports = router
