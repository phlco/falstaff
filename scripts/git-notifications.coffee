# Description:
# Dependencies:
# Commands:
# Notes:
# Author:
hipchat = require('node-hipchat')
HC = new hipchat('94f92ca23f75a2b38fa38ed847a221')

module.exports = (robot) ->

  robot.router.get '/', (req, res) ->
    res.send "Good Morrow!"
    HC.listRooms (data) ->
      console.log(data)

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
      sender = payload.sender
      repo = payload.repository
      # CoffeeScript Heredoc!
      msg = """
        <a href="#{sender.html_url}">
          <img src=#{sender.avatar_url}&size=25>
          #{sender.login}
        </a> pushed to <a href="#{repo.html_url}">#{repo.name}</a>
      """
      # robot.messageRoom("39979_tinkerers@conf.hipchat.com", msg)
      params = {
        room: 561124 # xmpp_jid = "39979_tinkerers@conf.hipchat.com"
        from: 'GitHub' # owner_id 361571
        message: msg
        color: 'yellow'
      }

      HC.postMessage params, (data) ->
        console.log("sent")
    catch error
      console.log(error)
