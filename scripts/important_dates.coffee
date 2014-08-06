# Description:
#   Important course dates
#
# Dependencies:
#   class_config.json
#
# Configuration:
#   Important dates are stored in the important_dates object
#
# Commands:
#   hubot when is the last day of class
#   hubot when is the first day of class
#   hubot vacation dates
#   hubot office hours
#
# Notes:
#
# Author:
#   phlco

important_dates = require('../class_config').important_dates

module.exports = (robot) ->
  robot.respond /when (is|was) the (.*) day of class/i, (msg) ->
    emit = important_dates["#{msg.match[2].toLowerCase()}_day"]
    msg.send emit

  robot.respond /vacation (vacation dates|days)/i, (msg) ->
    msg.send important_dates.days_off.join('\n')

  robot.respond /(lab days|labs)i/, (msg) ->
    msg.send important_dates.labs.join('\n')

  robot.respond /office hours/i, (msg) ->
    msg.send important_dates.office_hours.join('\n')

  robot.respond /d(ates)? vacation/i, (msg) ->
    msg.send important_dates.days_off.join('\n')

  robot.respond /d(ates)? office hours/i, (msg) ->
    msg.send important_dates.office_hours.join('\n')

  robot.respond /d(ates)? labs/i, (msg) ->

  robot.respond /d(ates)? first day/i, (msg) ->
    msg.send important_dates.first_day

  robot.respond /d(ates)? last day/i, (msg) ->
    msg.send important_dates.last_day

