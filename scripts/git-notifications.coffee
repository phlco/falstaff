# Description:
# Dependencies:
# Commands:
# Notes:
# Author:

module.exports = (robot) ->
  robot.router.post '/postreceive', (req, res) ->
    data   = req.body
    console.log data
    # robot.emit "post", req
    res.writeHead 201, {'Content-Type': 'application/json'}
    res.end({msg: "notfication processed"})

  # robot.on "post", (event) ->
  #   console.log("event", event);
  #   robot.messageRoom("39979_gildy@conf.hipchat.com", "message")
