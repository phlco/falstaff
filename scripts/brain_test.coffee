# Description:
# Dependencies:
# Commands:
# Notes:
# Author:

module.exports = (robot) ->

  # Event fired when brain is loaded
  robot.brain.on 'loaded', ->
    console.log("brain loaded")
    # recalling or initializing
    robot.brain.data.dates ||= []

  # Hear listens for any string
  robot.hear /add (.*) to (.*)/i, (msg) ->
    date =
      # Matches are captured on msg starting at 1
      name: msg.match[1]
      time: msg.match[2]
    robot.brain.data.dates.push(date)
    msg.emote "adding..."

  robot.hear /upcoming events/i, (msg) ->
    # return unless dates exists
    return unless robot.brain.data.dates?
    msg.emote "remembering"
    for date in robot.brain.data.dates
      msg.send "What: #{date.name} : When #{date.time}"
