# Description:
# Dependencies:
# Configuration:
# Commands:
# Notes:
# Author:

# GitHubApi = require("github")
_ = require("underscore")

# github = new GitHubApi
#   # required
#   version: "3.0.0"
#   # optional
#   # debug: true
#   # protocol: "https"
#   # host: "github.my-GHE-enabled-company.com"
#   # pathPrefix: "/api/v3" # for some GHEs
#   timeout: 5000

# github.authenticate
#   type: "oauth"
#   token: "a186ddabeaf32a61c6ee6e7b323c4d257f71e21b"

base_url = "https://api.github.com"

module.exports = (robot) ->

  robot.respond /gists/, (msg) ->

    msg.emote "Looking up..."
    msg.http("#{base_url}/gists")
      .query("access_token", "a186ddabeaf32a61c6ee6e7b323c4d257f71e21b")
      .get() (err, res, body) ->
        gists = JSON.parse body
        for gist in gists
          msg.send "id: #{gist.id} #{gist.description} : #{gist.url}"

  robot.respond /show gist (.*)/i, (msg) ->
    id = msg.match[1]

    msg.emote "Looking up..."
    msg.http("#{base_url}/gists/#{id}")
      .query("access_token", "a186ddabeaf32a61c6ee6e7b323c4d257f71e21b")
      .get() (err, res, body) ->
        gist = JSON.parse body
        for file, properties of gist
          msg.send properties.content
