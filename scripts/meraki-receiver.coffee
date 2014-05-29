# Description:
#
# Dependencies:
#
# Commands:
#
#   GET http://HUBOT_URL:PORT/meraki
#   POST http://HUBOT_URL:PORT/meraki
#
# Notes:
#   Requires http listening.
#   Add `export PORT=8080` to `bin/hubot` config
#   Be sure to set environmental variables for
#   `MERAKI_SECRET` and `MERAKI_VALIDATOR`
#   https://docs.meraki.com/display/MR/Location+API
#
# Author:
#   phlco
#   Adapted from https://docs.meraki.com/download/attachments/12255364/merakiReceiver.js.zip?version=1&modificationDate=1369861796512&api=v2
#   https://coderwall.com/p/awus5w

_ = require "underscore"

# Secret that you chose in the Meraki dashboard
secret = process.env.MERAKI_SECRET

# Validator string that is shown in the Meraki dashboard
validator = process.env.MERAKI_VALIDATOR

module.exports = (robot) ->

  # Meraki will send a HTTP GET request to test the URL
  # and expect to see the validator as a response.
  robot.router.get '/meraki', (req, res) ->
    console.log("sending validation")
    res.writeHead 200, {'Content-Type': 'text/plain'}
    res.end validator
    # res.send(validator)

  # When it sends the presence information, it will also send the secret.
  robot.router.post '/meraki', (req, res) ->
    try
      # req.body => {version: "1.0", secret: "y7WALfkjPfQMgtXZtW", probing: Array[46]}
      payload = JSON.parse(req.body.data)
      if payload.secret is secret
        console.log("valid data")
        # console.log(payload) # array of mac addresses
        # ap_mac: "00:18:0a:36:3b:42"
        # client_mac: "4c:8d:79:e9:4a:dc"
        # is_associated: "true"    # on GA guest or ed?
        # last_seen: "Thu May 29 22:18:52.033 UTC 2014"
        # rssi: "28"               # maximum signal strength
        # TODO (phlco) use underscore to check for my mac address?
        # find mac address if last seen is today then you're here
        # user = _.findWhere(payload, { client_mac: "54:26:96:35:0B:C8"})
        # if user?
        #   console.log("Philco is here. Last seen #{user.last_seen}")
      else
        console.log("invalid secret from #{req.connection.remoteAddress}")
    catch error
      console.log("Error.")
      console.log(error)
      res.end()
