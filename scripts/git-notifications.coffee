# Description:
# Dependencies:
# Commands:
# Notes:
# Author:

module.exports = (robot) ->
  robot.router.post '/postreceive', (req, res) ->
    console.log req
    robot.emit "post", req
    res.writeHead 201, {'Content-Type': 'text/plain'}
    res.end()

  robot.on "post", (event) ->
    console.log("event", event);
    robot.messageRoom("39979_gildy@conf.hipchat.com", "message")
