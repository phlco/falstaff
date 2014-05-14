# Include required libraries
# Cheerio is used to parse the html and extract data
cheerio = require('cheerio')

RAILSCASTS_BASE_URL = "http://railscasts.com/"

# Indicate that you are defining a script
module.exports = (robot) ->

  robot.brain.on 'loaded', =>
    console.log("brain loaded")
    robot.brain.data.dates or= []

  robot.hear /schedule (.*) for (.*)/i, (msg) ->
    date =
      name: msg.match[1]
      time: msg.match[2]
    dates.push(date)
    msg.emote "Remembering..."

  robot.hear /upcoming events/i, (msg) ->
    return unless robot.brain.data.dates?
    msg.emote "remembering"
    dates = robot.brain.dates
    for date in dates
      msg.send "What: #{date.name} : When #{date.time}"

  # Define your regular expressions to match
  robot.respond /link me (.*)/i, (msg) ->
    # Get the query and form the search url
    query = msg.match[1]
    URL = "http://railscasts.com/episodes?search=#{query}"

    # Make a http call to railscasts
    robot.http(URL).get() (err, res, body) ->
      # Parse and reply with episodes found
      $ = cheerio.load(body)
      # Only first 5 episodes to be returned
      $('.episode').slice(0, 5).each ->
        msg.send "Title: " + $(this).find('h2 a').first().text().replace /^\s+|\s+$/g, ""
        msg.send $(this).find('.info .number').text()
        msg.send "Link: " + RAILSCASTS_BASE_URL + $(this).find('h2 a').first().attr('href')
        # Delimiter for episodes
        msg.send Array(4).join '~'
