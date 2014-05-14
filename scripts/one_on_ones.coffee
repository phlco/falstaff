url = "https://gist.githubusercontent.com/phlco/c6a70b30771d36c9918c/raw/1a58a286529ae324fca4de7e2d6b2ccc70126501/schedule.json"

module.exports = (robot) ->

  robot.respond /one on ones/i, (msg) ->
    msg.http(url).get() (err, res, body) ->
      console.log(body)
