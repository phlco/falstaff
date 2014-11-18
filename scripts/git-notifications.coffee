# Description:
# Dependencies:
# Commands:
# Notes:
# Author:

hipchat = require('node-hipchat')
HC = new hipchat(process.env.HIPCHAT_ADMIN_API_TOKEN)

module.exports = (robot) ->

  robot.router.get '/', (req, res) ->
    res.send "Good Morrow!"
    HC.listRooms (data) ->
      console.log(data)

  # this is configured at
  # https://github.com/ga-students/godot_instructors/settings/hooks/3318009
  # may change these to individual hooks for push etc
  robot.router.post '/postreceive', (req, res) ->
    try
      payload = req.body or req
      eventType = req.headers['X-GitHub-Event']
      console.log(eventType)
      robot.emit "post", payload
      res.status(201).json({ status: '201' })
    catch error
      console.log(error)
      res.end()

  robot.on "post", (payload) ->
    # hubot doesn't do HTML formatting so
    # Sending the message with the hipchat API
    try
      sender = payload.sender
      repo   = payload.repository
      # CoffeeScript Heredoc!
      msg = """
        <a href="#{sender.html_url}">
          <img src=#{sender.avatar_url}&size=25>
          #{sender.login}
        </a> pushed to <a href="#{repo.html_url}">#{repo.name}</a>
      """
      # robot.messageRoom("39979_tinkerers@conf.hipchat.com", msg)
      params = {
        # room: 561124 # xmpp_jid = "39979_tinkerers@conf.hipchat.com"
        # room: 743754 # xmpp_jid = "39979_gildy@conf.hipchat.com"
        room: 910040 # xmpp_jid = "39979_godot@conf.hipchat.com"
        from: 'GitHub'
        message: msg
        color: 'yellow'
      }

      HC.postMessage params, (data) ->
        console.log("sent")
    catch error
      console.log(error)
