# Description:
# Dependencies:
# Commands:
# Notes:
# Author:

# Testing Authorized Users

module.exports = (robot) ->

  robot.respond /get class/, (msg) ->
    msg.emote "Checking status"
    user = msg.message.user
    room = msg.message.room
    console.log(user)
    console.log( robot.auth.hasRole(user, 'an instructor') )
    if robot.auth.hasRole(user, 'an instructor')
      msg.send "Here is the class"
    else
      msg.emote "Shaking head"
