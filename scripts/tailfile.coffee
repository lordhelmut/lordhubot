# Description:
#   Let hubot tail some files
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot tail <file> 
#
# Author:
#   lordhelmut

module.exports = (robot) ->
  robot.respond /tail (.*)/, (msg) ->
   filename = msg.match[1]
   command = "tail -n 3 " + filename
   sh = require('child_process')
   sh.exec command,(error, stdout, stderr) ->
     msg.reply stdout if stdout
     msg.reply "Error: #{stderr}" if stderr
