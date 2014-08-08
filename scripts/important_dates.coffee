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

class_config = require('../class_config')
important_dates = class_config.important_dates
office_hours = class_config.office_hours

module.exports = (robot) ->


  robot.respond /(?:day(?:s)?|date(?:s)?)[\s]*(start|end)/i, (msg) ->
    emit = important_dates["#{msg.match[1].toLowerCase()}_day"]
    msg.send emit

  robot.respond /(?:day(?:s)?|date(?:s)?)[\s]*(lab(?:s))/i, (msg) ->
    emit = important_dates["labs"].join('\n')
    msg.send emit

  robot.respond /(?:day(?:s)?|date(?:s)?)[\s]*(vacation|days off)/i, (msg) ->
    emit = important_dates["days_off"].join('\n')
    msg.send emit

  robot.respond /(?:day(?:s)?|date(?:s)?)[\s]*(office hours)/i, (msg) ->
    console.log(msg)
    console.log(important_dates)
    emit = office_hours.join('\n')
    msg.send emit
