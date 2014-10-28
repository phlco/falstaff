# Description:
# Dependencies:
# Commands:
# Notes:
# Author:

module.exports = (robot) ->
  robot.router.post '/postreceive', (req, res) ->
    console.log("post headers", req.headers)
    console.log("post body", req.body)
    robot.emit "post", req.body
    res.writeHead 201, {'Content-Type': 'text/plain'}
    res.end()

  robot.on "post", (event) ->
    console.log("event", event);
    robot.messageRoom("39979_gildy@conf.hipchat.com", "message")
