# Description:
# Dependencies:
# Commands:
# Notes:
# Author:

module.exports = (robot) ->
  robot.router.get '/postreceive', (req, res) ->
    console.log("github notification", res)
