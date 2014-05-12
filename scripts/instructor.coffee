module.exports = (robot) ->

  robot.respond /get class/, (msg) ->
    user = msg.message.user
    room = msg.message.room
    console.log(user)
    console.log( robot.auth.hasRole(user, 'an instructor') )
    msg.emote "Checking status"
