# Description:
#   Displays the description for the requested error code.
#
# Dependencies:
#   "cheerio": "~0.16.0"
#
# Configuration:
#   None
#
# Commands:
#   hubot http status <code>
#
# Author:
#   delianides
#

cheerio = require 'cheerio'

module.exports = (robot) ->
  robot.respond /http status (.*)/i, (msg) ->
    httpCode = msg.match[1]
    msg
      .http('http://en.wikipedia.org/wiki/List_of_HTTP_status_codes')
      .get() (err, res, body) ->
          $ = cheerio.load(body)
          statusCode = $('#'+httpCode).parent().text()
          if statusCode
            msg.send statusCode
            msg.send "http://en.wikipedia.org/wiki/List_of_HTTP_status_codes##{httpCode}"
          else
            msg.send "HTTP status code '#{httpCode}' doesn't exist. Ironically, this would be HTTP Error 404."
