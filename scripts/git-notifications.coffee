# Description:
# Dependencies:
# Commands:
# Notes:
# Author:

module.exports = (robot) ->
  robot.router.post '/postreceive', (req, res) ->
    console.log("post received", req.body.zen)
    robot.messageRoom "39979_tinkerers@conf.hipchat.com", req.body.zen
    res.writeHead 201, {'Content-Type': 'text/plain'}
    res.end()


