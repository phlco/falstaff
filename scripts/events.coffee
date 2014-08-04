# Description:
# Dependencies:
# Commands:
# Notes:
# Author:

util = require 'util'

module.exports = (robot) ->

  robot.respond /FAKE EVENT (.*)/i, (msg) ->
    msg.send "fake event '#{msg.match[1]}' triggered"
    robot.emit msg.match[1], {user: msg.message.user}

  robot.on 'debug', (event) ->
    robot.send event.user, util.inspect event
