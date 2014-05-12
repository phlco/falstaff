# https://docs.meraki.com/display/MR/Location+API

# Secret that you chose in the Meraki dashboard
secret = "xxxxxx"

# Validator string that is shown in the Meraki dashboard
validator = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

module.exports = (robot) ->

  # Meraki will send a HTTP GET request to test the URL and expect to see the
  # validator as a response.
  robot.router.get '/meraki', (req, res) ->
    res.send(validator)
    console.log("sending validation")

  # When it sends the presence information, it will also send the secret.
  robot.router.post '/meraki', (req, res) ->
    try
      jsoned = JSON.parse(req.body.data)
      if jsoned.secret is secret
        console.log("valid data")
        console.log(req.body)
      else
        console.log("invalid secret from #{req.connection.remoteAddress}")
    catch error
      console.log("Error.")
      console.log(error)
      res.end()
