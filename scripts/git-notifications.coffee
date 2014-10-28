# Description:
# Dependencies:
# Commands:
# Notes:
# Author:

module.exports = (robot) ->

  robot.router.get '/', (req, res) ->
    res.send "Good Morrow!"

  robot.router.post '/postreceive', (req, res) ->
    try
      payload = req.body or req
      robot.emit "post", payload
      res.status(201).json({ status: '201' })
    catch error
      console.log(error)
      res.end()

  robot.on "post", (payload) ->
    try
      msg = "#{payload.sender.login} pushed to #{payload.repository.name} <img src=\"#{payload.sender.avatar_url}\">"
      robot.messageRoom("39979_tinkerers@conf.hipchat.com", msg)
      # robot.send payload.sender.login, "#{payload.sender.login} Will now deploy!"
    catch error
      console.log(error)
