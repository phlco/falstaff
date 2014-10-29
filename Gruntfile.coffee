http = require('http')
request = require('request')

module.exports = (grunt) ->

  grunt.registerTask 'default', 'Log some stuff.', ->
    grunt.log.write('Logging some stuff...').ok()

  grunt.registerTask 'google', 'google stuff', ->
    request "http://www.google.com", (error, response, body) ->
      # Print the google web page.
      if not error and response.statusCode is 200
        grunt.log.write( body ).ok()
