module.exports = (robot) ->

  robot.respond /woo me/i, (msg) ->
    msg.reply "We should be wooed and were not made to woo."
