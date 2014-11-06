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
info   = Url.parse(process.env.REDISTOGO_URL) || 'redis://localhost:6379'
client = Redis.createClient(info.port, info.hostname)

student =
  ipv4: "/10.243.142.81"
  location:
    lat: 40.739449184242254
    lng: -73.99017125635419
    unc: 5.382444537719392
    x: {}
    y: {}

  seenTime: "2014-11-05T03:28:29Z"
  ssid: "GA-Guest"
  os: "Mac OS X"
  clientMac: "28:cf:da:ed:b8:24"
  seenEpoch: 1415158109
  rssi: 29
  ipv6: null
  manufacturer: "Apple"

module.exports = (robot) ->

  robot.respond /attendance/i, (msg) ->
    today = moment().format("YYYYMMDD")
    msg.emote "Fetching attendance for today, #{today}"
    client.smembers("attendance:#{today}", (err, members) ->
      msg.send "Number of entries: #{members.length}"
      # for member in members
      #   msg.send member
    )

  robot.respond /track/i, (msg) ->
    date = moment(student.seenTime).format("YYYYMMDD")
    client.sadd("attendance:#{date}", student.clientMac)
    msg.send("added")
