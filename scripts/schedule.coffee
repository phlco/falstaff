# Description:
# Dependencies:
# Commands:
# Notes:
# Author:

moment = require('moment')

module.exports = (robot) ->

  robot.respond /data/, (msg) ->
    msg.reply moment().format("YYYY-MM-DD")

  robot.respond /what week is it?/i, (msg) ->
    start_date = moment(process.env.WDI_START_DATE)
    week_number = moment().diff(start_date, 'weeks') + 1
    msg.reply "Week #{week_number}"

  robot.respond /What day [of the week [is|was]] (.*)\?/i, (msg) ->
    date = msg.match[1]
    msg.reply moment(date).format('dddd')

  robot.respond /day folder/i, (msg) ->
    day = moment().day()
    start_date = moment(process.env.WDI_START_DATE)
    week_number = moment().diff(start_date, 'weeks') + 1
    week = if week_number.toString().length is 1
      "0#{week_number}"
    else
      week_number
    msg.reply "w#{week}d#{day}"

  robot.respond /homework link/i, (msg) ->
    msg.send homework_link()

week = () ->
  start_date = moment(process.env.WDI_START_DATE)
  week_number = moment().diff(start_date, 'weeks') + 1
  if week_number.toString().length is 1
    "0#{week_number}"
  else
    week_number

day = () ->
  "0#{moment().day()}"

url = () ->
  class_repo = "WDI_NYC_Feb14_Reduce"
  base_url = "https://github.com/ga-students/"
  branch = "/tree/master/"
  base_url + class_repo + branch

homework_link = () ->
  url() + "#{week()}/#{day()}"

readme = () ->
  # https://github.com/ga-students/WDI_NYC_Feb14_Reduce/raw/master/w02/d04/INSTRUCTOR/README.md
