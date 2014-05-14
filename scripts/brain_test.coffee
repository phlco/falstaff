module.exports = (robot) ->

  robot.brain.on 'loaded', ->
    console.log("brain loaded")
    robot.brain.data.dates ||= []

  robot.hear /schedule (.*) for (.*)/i, (msg) ->
    date =
      name: msg.match[1]
      time: msg.match[2]
    robot.brain.data.dates.push(date)
    msg.emote "adding..."

  robot.hear /upcoming events/i, (msg) ->
    return unless robot.brain.data.dates?
    msg.emote "remembering"
    for date in robot.brain.data.dates
      msg.send "What: #{date.name} : When #{date.time}"
