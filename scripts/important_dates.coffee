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
#
# Notes:
#
# Author:
#   phlco
important_dates = require('./class_config').important_dates

module.exports = (robot) ->
  robot.respond /when (is|was) the (.*) day of class/i, (msg) ->
    emit = important_dates["#{msg.match[2].toLowerCase()}_day"]
    msg.send emit

  robot.respond /vacation (days|dates)/i, (msg) ->
    msg.send important_dates.days_off.join('\n')


