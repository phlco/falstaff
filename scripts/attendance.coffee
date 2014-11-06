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
  client = Redis.createClient(info.port, info.hostname)

  robot.respond /attendance/i, (msg) ->
    today = moment().format("YYYYMMDD")
    msg.emote "Fetching attendance for today, #{today}. This may take awhile..."
    console.log(client)
    client.smembers("attendance:#{today}", (err, members) ->
      for member in members
        msg.send member
    )

  robot.respond /track/i, (msg) ->
    date = moment(student.seenTime).format("YYYYMMDD")
    client.sadd("attendance:#{date}", student.clientMac)
    msg.send("added")
