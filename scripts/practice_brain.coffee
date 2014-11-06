_      = require "underscore"
moment = require "moment"

module.exports = (robot) ->
  robot.brain.data.attendance ?= {}

  robot.respond /add (.*)/i, (msg) ->
    student = msg.match[1]
    date = moment().format("YYYYMMDD")
    robot.brain.data.attendance[date] ?= {}
    robot.brain.data.attendance[date][student] = "present"
    msg.send "ok added"

  robot.respond /check/i, (msg) ->
    date = moment().format("YYYYMMDD")
    msg.emote "Checking for #{date}..."
    _.each(robot.brain.data.attendance[date], (value, key, list) ->
      console.log(value)
      console.log(key)
      msg.send(value)
      msg.send(key)
    )
