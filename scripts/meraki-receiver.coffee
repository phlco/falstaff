# Description:
# Dependencies:
# Commands:
# Notes:
# Author:

_      = require "underscore"
moment = require 'moment'
Url    = require "url"
Redis  = require "redis"

# Secret that you chose in the Meraki dashboard
secret = process.env.MERAKI_SECRET

# Validator string that is shown in the Meraki dashboard
validator = process.env.MERAKI_VALIDATOR

module.exports = (robot) ->

  info   = Url.parse(process.env.REDISTOGO_URL) || process.env.BOXEN_REDIS_URL || 'redis://localhost:6379'
  client = Redis.createClient(info.port, info.hostname)
  # Meraki will send a HTTP GET request to test the URL
  # and expect to see the validator as a response.
  robot.router.get '/meraki', (req, res) ->
    res.set('Content-Type', 'text/plain')
    res.send(200, validator)

  # When it sends the presence information, it will also send the secret.
  robot.router.post '/meraki', (req, res) ->
    # Version 2 of the API sends back JSON
    try
      if req.body.secret is secret
        robot.emit("valid-meraki-data", req.body.data)
      else
        console.log("invalid secret from #{req.connection.remoteAddress}")
    catch error
      console.log("Error.")
      console.log(error)
    finally
      res.end()

  robot.on "valid-meraki-data", (payload) ->
    ga_guests = _.filter(payload.observations, (guest) -> guest.ssid is "GA-Guest")
    # console.log(ga_guests)
    # seenTime Observation time in UTC;
    # seenEpoch Observation time in seconds since the UNIX epoch
    mac_addresses = ['28:cf:da:ed:b8:24', '58:b0:35:7f:2e:ca', '5c:f9:38:ac:91:50']
    wdi_students = _.filter(ga_guests, (guest) -> _.contains(mac_addresses, guest.clientMac))
    console.log(wdi_students)
    _.each(wdi_students, (student) ->
      date = moment(student.seenTime).format("YYYYMMDD")
      # robot.brain.set("attendance:#{date}:#{student.clientMac}", "present")
      client.set("attendance:#{date}:#{student.clientMac}", "present", Redis.print)
    )
