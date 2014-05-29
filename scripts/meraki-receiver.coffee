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

# Secret that you chose in the Meraki dashboard
secret = process.env.MERAKI_SECRET

# Validator string that is shown in the Meraki dashboard
validator = process.env.MERAKI_VALIDATOR

module.exports = (robot) ->

  # Meraki will send a HTTP GET request to test the URL
  # and expect to see the validator as a response.
  robot.router.get '/meraki', (req, res) ->
    console.log("sending validation")
    res.send(validator)

  # When it sends the presence information, it will also send the secret.
  robot.router.post '/meraki', (req, res) ->
    try
      # jsoned = JSON.parse(req.body.data)
      console.log(req.body)
      jsoned = req.body
      if jsoned.secret is secret
        console.log("valid data")
        console.log(req.body)
      else
        console.log("invalid secret from #{req.connection.remoteAddress}")
    catch error
      console.log("Error.")
      console.log(error)
      res.end()
