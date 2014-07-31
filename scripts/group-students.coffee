# Description:
#   break up students into groups of n
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   groups of n
#
# Author:
#   phlco

_ = require('underscore')
 # node attempts to load the filename with the added extension of
 # .js, .json, and then .node.
student_roster = require('./student_roster').student_roster

module.exports = (robot) ->
  robot.respond /groups of (.*)/i, (msg) ->
    number = msg.match[1]
    group_students_by number, (student_groups) ->
      msg.send student_groups.join('\n\n')

group_students_by = (number, cb) ->
  student_roster = _.shuffle(student_roster)
  groups = _.groupBy(student_roster, (element, index) -> Math.floor index/number)
  grouped = _.toArray(groups)
  if grouped[grouped.length - 1].length is 1
    tail = grouped.pop()
    grouped[grouped.length - 1].push tail...
  cb(grouped)
