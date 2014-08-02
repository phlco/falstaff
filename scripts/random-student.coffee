# Description:
#   Select a random student from a pre-defined list.
#
# Dependencies:
#   class_config.json
#
# Configuration:
#   None
#
# Commands:
#   hubot random student <list> -- pick a random student from the given list.
#   TODO: load students from json or hipchat
#
# Author:
#   sumeetjain
#   adapted by phlco

student_roster = require('../class_config').student_roster

module.exports = (robot) ->

  robot.respond /random student/i, (msg)->
    if student_roster.length == 0
      msg.send("Provide a list.")
    else
      msg.send(random_student(student_roster))

random_student = (student_roster) ->
  random_index = (Math.random() * student_roster.length) >> 0
  student_roster[random_index]
