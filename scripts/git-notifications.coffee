# Description:
# Dependencies:
# Commands:
# Notes:
# Author:

module.exports = (robot) ->

  robot.router.post '/postreceive', (req, res) ->
    try
      data   = req.body
      console.log data.zen
      robot.emit "post", data
      # res.status(201).send('Response received')
      res.status(201).json({ status: '201' })
    catch error
      console.log(error)
      res.end()


  robot.on "post", (event) ->
    console.log("event", event.zen);
    # robot.messageRoom("39979_gildy@conf.hipchat.com", "message")
