# Description:
# Dependencies:
# Commands:
# Notes:
# Author:

module.exports = (robot) ->
  robot.router.post '/postreceive', (req, res) ->
    console.log("github notification", req)
    robot.messageRoom "39979_tinkerers@conf.hipchat.com", req.zen
    res.writeHead 201, {'Content-Type': 'text/plain'}
    res.end()
