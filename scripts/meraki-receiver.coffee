# https://docs.meraki.com/display/MR/Location+API

# Secret that you chose in the Meraki dashboard
secret = "y7WALfkjPfQMgtXZtW"

# Validator string that is shown in the Meraki dashboard
validator = "ef964744f5a30a7b5f41ec73482712c26eb4a5fa"

module.exports = (robot) ->

  # Meraki will send a HTTP GET request to test the URL and expect to see the
  # validator as a response.
  robot.router.get '/meraki', (req, res) ->
    res.send(validator)
    console.log("sending validation")

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
