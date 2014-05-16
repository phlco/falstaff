# Description:
# Dependencies:
# Commands:
# Notes:
# Author:

module.exports = (robot) ->

  robot.respond /woo me/i, (msg) ->
    msg.reply "We should be wooed and were not made to woo."

  robot.on "bard", (bard) ->
    console.log(bard)

  robot.topic (msg) ->
    msg.send "#{msg.message.text}? That's a Paddlin'"
