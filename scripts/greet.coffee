# Description:
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:

module.exports = (robot) ->

  robot.respond /hello/i, (msg) ->
    msg.send "How now, my sweet creature of bombast?"
