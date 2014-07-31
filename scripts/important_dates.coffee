# Description:
#   Important course dates
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

module.exports = (robot) ->
  robot.respond /when (is|was) the (.*) day of class/i, (msg) ->
    emit = important_dates["#{msg.match[2].toLowerCase()}_day"]
    msg.send emit

  robot.respond /vacation (days|dates)/i, (msg) ->
    msg.send important_dates.days_off.join('\n')

important_dates =
  prework: [
    "July 18, 2014"
    "July 31, 2014"
  ]
  installfest: "July 31, 2014"
  last_day: "October 30th, 2014"
  first_day: "Monday August 4, 2014"
  days_off: [
    "September 1, 2014"
    "September 25, 2014"
    "September 26, 2014"
    "October 13, 2014"
  ]
  labs: [
    "August 29, 2014"
    "October 3, 2014"
  ]
  projects: [
    "September 2, 2014"
  ]
