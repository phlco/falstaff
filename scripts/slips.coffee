# Description:
#   Grabs lesson objectives from an API endpoint and presents them to the user
#
# Commands:
#   hubot l-o me (<type>) (<date-range>) - returns a random lo with the given filters
#   hubot slip me - calls `l.o. me conceptual w-1`, ie conceptual los from last week
#   hubot l-os (<date-range>) - returns all los, for a date range if given
#
# Author:
#   h4w5
#
# Notes:
#   Filters not implemented yet! # TODO h4w5
#

objectives_url = require('../class_config').objectives_url
_ = require 'underscore'

module.exports = (robot) ->

  robot.respond /l-os/i, (msg) ->
    get_lesson_objectives_from msg, (objectives) ->
      for objective in objectives
        msg.send format(objective)

  robot.respond /l-o me/i, (msg) ->
    get_lesson_objectives_from msg, (objectives) ->
      msg.send format(_.sample objectives)

get_lesson_objectives_from = (msg, callback) ->
  msg.emote "Looking up..."
  msg.http("#{objectives_url}")
    .get() (err, res, body) ->
      if err
        msg.send "Could not connect to #{objectives_url}... Try again!"
      else
        json = JSON.parse body
        callback json

format = (objective, lesson = true, type = true) ->
  formatted_objective = ""
  if objective.lesson != "--" && lesson = true
    formatted_objective += "#{objective.lesson}"
  if objective.type != "--" && type = true
    formatted_objective += " (#{objective.type})"
  if formatted_objective != ""
    formatted_objective += ": "
  formatted_objective += "#{objective.text}"
