module.exports = (robot) ->

  robot.respond /get class/, (msg) ->
    user = msg.message.user
    console.log( robot.auth.hasRole(user, 'instructor') )
    msg.emote "Checking status"
