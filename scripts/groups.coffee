# Description:
#   Supports breaking up students into groups.
#
# Dependencies:
#   class_config.json
#
# Configuration:
#   None
#
# Commands:
#   hubot groups of <n>
#   hubot <n> groups
#
# Author:
#   phlco
#   h4w5 in a supporting role

_ = require('underscore')

student_roster = require('../class_config').student_roster

module.exports = (robot) ->

  robot.respond /groups of (\d+)/i, (msg) ->
    number = msg.match[1]
    group_students_by number, (student_groups) ->
      msg.send student_groups.join('\n\n')

  robot.respond /(\d+) groups/i, (msg) ->
    number = Math.floor student_roster.length / msg.match[1]
    group_students_by number, (student_groups) ->
      msg.send student_groups.join('\n\n')

group_students_by = (number, cb) ->
  student_roster = _.shuffle(student_roster)
  groups = _.groupBy(student_roster, (element, index) -> Math.floor index/number)
  grouped = _.toArray(groups)
  if grouped[grouped.length - 1].length is 1
    tail = grouped.pop()
    grouped[grouped.length - 1].push tail...
  grouped = _.map(grouped, (group) -> group.join(", ") )
  cb(grouped)
