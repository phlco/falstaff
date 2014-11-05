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
  info   = Url.parse(process.env.REDISTOGO_URL) || process.env.BOXEN_REDIS_URL || 'redis://localhost:6379'
  client = Redis.createClient(info.port, info.hostname)

  robot.respond /attendance/, (msg) ->
    # today = moment().format("YYYYMMDD")
    today = moment(student.seenTime).format("YYYYMMDD")
    msg.emote "Fetching attendance for today, #{today}"

    client.keys("attendance:#{today}:*", (err, mac_addresses) ->
      console.log(mac_addresses.length)
      client.quit()
      msg.send("inner function")
      _.each(mac_addresses, (mac_address) ->
        msg.send(mac_address)
      )
    )

  robot.respond /track/i, (msg) ->
    date = moment(student.seenTime).format("YYYYMMDD")
    client.set("attendance:#{date}:#{student.clientMac}", "present")
    msg.send("added")
