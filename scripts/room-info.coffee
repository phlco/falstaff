# _ = require('underscore')

# student_roster = require('../class_config').student_roster

module.exports = (robot) ->

  robot.respond /(bathroom|washroom) code/i, (msg) ->
    msg.send '3140#'
