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

    robot.emit "bard", {
        user    : {}, #hubot user object
        repo    : 'https://github.com/github/hubot',
        hash    : '2e1951c089bd865839328592ff673d2f08153643'
    }
