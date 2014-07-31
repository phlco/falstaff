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
    msg.send "Hear ye! Hear ye! #{msg.message.text}"

  robot.respond /play on!/, (msg) ->
    msg.reply "https://www.youtube.com/watch?v=5SvEttR6HTY"
