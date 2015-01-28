# https://www.npmjs.com/package/body-parser
bodyParser = require("body-parser")
express = require 'express'
debug = require('debug')('route::body_parser');
config = require '../config'

router = express.Router()

router.use bodyParser.json config.bodyParser.json
router.use bodyParser.urlencoded config.bodyParser.urlencoded

module.exports = router
