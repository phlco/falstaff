# Description:
#   Allows our fellow to dazzle the audience with his clever designs.
#
# Configuration:
#   None
#
# Commands:
#   hubot quote me
#   hubot what say you
#
# Author:
#   h4w5

_      = require 'underscore'
quotes = [
  'I would my means were greater, and my waist slenderer.',
  'Boy, tell him I am deaf.',
  'To wake a wolf is as bad as smell a fox.',
  'I am old, I am old.',
  'Money is a good soldier, sir, and will on.',
  'Come hither, hostess.',
  'You make fat rascals, Mistress Doll.',
  'She is pistol-proof, sir; you shall not hardly offend her.',
  'Give me my rapier, boy.',
  'A rascally slave! I will toss the rogue in a blanket.',
  'Kiss me, Doll.',
  'I am better than thou: I am a gentleman; thou art a drawer.',
  'His Grace says that which his flesh rebels against.',
  'Thou art a very ragged wart.',
  'What disease hast thou?',
  'What, dost thou roar before thou art prick\'d?',
  'Let it shine, then.',
  'Well said, Master Silence.',
  'God save thee, my sweet boy!',
  'Banish plump Jack, and banish all the world.'
]

module.exports = (robot) ->

  robot.respond /quote me( (x *)?(\d+))?/i, (msg) ->
    if msg.match[3]?
      msg.send speech(msg.match[3])
    else
      msg.send _.sample(quotes)

  robot.respond /what say you( (x *)?(\d+))?/i, (msg) ->
    if msg.match[3]?
      msg.send speech(msg.match[3])
    else
      msg.send _.sample(quotes)

speech = (number) ->
  if number > 5
    soliloquy = _.first(_.shuffle(quotes), 5 ).join("\n")
    return "Five is enough, knave! Here:\n\n#{soliloquy}"
  else
    _.first(_.shuffle(quotes), number ).join("\n")
