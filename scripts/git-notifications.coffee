# Description:
# Dependencies:
# Commands:
# Notes:
# Author:

module.exports = (robot) ->
  robot.router.post '/postreceive', (req, res) ->
    console.log("github notification", res)
