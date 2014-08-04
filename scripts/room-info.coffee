# Description:
#
# Commands:
#
# Events:

module.exports = (robot) ->

  robot.respond /(bathroom|washroom) code/i, (msg) ->
    msg.send '3140#'
