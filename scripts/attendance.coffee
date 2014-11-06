# Description:
# Dependencies:
# Commands:
# Notes:
# Author:

# attendance is set in meraki-receiver like so:
# robot.brain.set("attendance:#{date}:#{student.clientMac}", "present")
moment = require('moment')
Url    = require("url")
Redis  = require("redis")
_      = require("underscore")

module.exports = (robot) ->
  info   = Url.parse(process.env.REDISTOGO_URL) || 'redis://localhost:6379'
  unless robot.redisClient?
    robot.redisClient = Redis.createClient(info.port, info.hostname, {
      retry_max_delay: 5000
      connect_timeout: 5000
      max_attempts: 4
    })

  robot.respond /attendance/i, (msg) ->
    today = moment().format("YYYYMMDD")
    msg.emote "Fetching attendance for today, #{today}. This may take awhile..."
    robot.redisClient.smembers("attendance:#{today}", (err, members) ->
      for member in members
        msg.send member
      msg.send "Done"
    )

  robot.respond /track/i, (msg) ->
    date = moment().format("YYYYMMDD")
    robot.redisClient.sadd("attendance:#{date}", "abcd")
    msg.send("added")


