# Description:
#   Select a random student from a pre-defined list.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot random student pick a random student from the student roster
#   TODO: break up students into groups of n
#   TODO: load students from json or hipchat
#
# Author:
#   sumeetjain
#   adapted by phlco

module.exports = (robot) ->

  robot.respond /random student/i, (msg)->
    list = msg.match[1].trim()
    if !lists[list]?
      msg.send("That's not a valid list.")
    else if list.length == 0
      msg.send("Provide a list.")
    else
      msg.send(random_student(student_roster))

random_student = (student_roster) ->
  random_index = (Math.random() * student_roster.length) >> 0
  student_roster[random_index]

student_roster = [
  "Evan Berg",
  "Robert Silverblatt ",
  "Michael Coniaris",
  "Jared Norcott",
  "Jessica Franko",
  "Andrew Fritz",
  "Aaron Gregory",
  "Michael Hall",
  "Janine Harper",
  "Erica Kantor",
  "Michael Larkin",
  "Sarah McDonald",
  "Jennifer Nguyen",
  "Ariel Olin",
  "Ryan Parks",
  "Gray Reinhard",
  "Maria Schettino",
  "Will Schjang",
  "Neil Sidhu",
  "Yinan Song",
  "Ade Ugbogbo",
  "Jacqueline Williams",
  "Carrie Xu",
  "Anastasia Konecky",
  "Thomas Truong"
]
