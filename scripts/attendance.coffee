# attendance is set in meraki-receiver like so:
# robot.brain.set("attendance:#{date}:#{student.clientMac}", "present")
moment = require 'moment'

module.exports = (robot) ->

  robot.respond /attendance/, (msg) ->
    date = new Date().toLocaleDateString('en-US')
    date = moment().format("YYYYMMDD")
    msg.emote "Fetching attendance for today, #{date}"
