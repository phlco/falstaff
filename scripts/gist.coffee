# Description:
# Dependencies:
# Configuration:
# Commands:
# Notes:
# Author:

# GitHubApi = require("github")
_ = require("underscore")
access_token = process.env.GITHUB_ACCESS_TOKEN
base_url = "https://api.github.com"

module.exports = (robot) ->

  robot.respond /gists/, (msg) ->

    msg.emote "Looking up..."
    msg.http("#{base_url}/gists")
      .query("access_token", access_token)
      .get() (err, res, body) ->
        gists = JSON.parse body
        for gist in gists
          msg.send "id: #{gist.id} #{gist.description} : #{gist.url}"

  robot.respond /show gist (.*)/i, (msg) ->
    id = msg.match[1]

    msg.emote "Looking up..."
    msg.http("#{base_url}/gists/#{id}")
      .query("access_token", access_token)
      .get() (err, res, body) ->
        gist = JSON.parse body
        for file, properties of gist
          msg.send properties.content
