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
      data = req.body
      robot.emit "post", data
      # res.status(201).send('Response received')
      res.status(201).json({ status: '201' })
    catch error
      console.log(error)
      res.end()

  robot.on "post", (payload) ->
    try
      console.log("event", payload.zen);
      robot.messageRoom("39979_tinkerers@conf.hipchat.com", "message")
      # robot.send payload.sender.login, "#{payload.sender.login} Will now deploy!"
    catch error
      console.log(error)
