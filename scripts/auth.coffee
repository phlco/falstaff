# Description:
# Dependencies:
# Commands:
# Notes:
# Author:

module.exports = (robot) ->

  unless process.env.HUBOT_AUTH_ADMIN?
    robot.logger.warning 'The HUBOT_AUTH_ADMIN environment variable not set'

  if process.env.HUBOT_AUTH_ADMIN?
    admins = process.env.HUBOT_AUTH_ADMIN.split ','
  else
    admins = []

  class Auth
    hasRole: (user, roles) ->
      user = robot.brain.userForId(user.id)
      if user? and user.roles?
        roles = [roles] if typeof roles is 'string'
        for role in roles
          return true if role in user.roles
      return false

    usersWithRole: (role) ->
      users = []
      for own key, user of robot.brain.data.users
        if robot.auth.hasRole(msg.envelope.user, role)
          users.push(user)
      users

  robot.auth = new Auth

  robot.respond /@?(.+) (has) (["'\w: -_]+) (role)/i, (msg) ->
    name    = msg.match[1].trim()
    newRole = msg.match[3].trim().toLowerCase()

    unless name.toLowerCase() in ['', 'who', 'what', 'where', 'when', 'why']
      user = robot.brain.userForName(name)
      return msg.reply "#{name} does not exist" unless user?
      user.roles or= []

      if newRole in user.roles
        msg.reply "#{name} already has the '#{newRole}' role."
      else
        if newRole is 'admin'
          msg.reply "Sorry, the 'admin' role can only be defined in the HUBOT_AUTH_ADMIN env variable."
        else
          myRoles = msg.message.user.roles or []
          if msg.message.user.id.toString() in admins
            user.roles.push(newRole)
            msg.reply "Ok, #{name} has the '#{newRole}' role."

  robot.respond /@?(.+) (doesn't have|does not have) (["'\w: -_]+) (role)/i, (msg) ->
    name    = msg.match[1].trim()
    newRole = msg.match[3].trim().toLowerCase()

    unless name.toLowerCase() in ['', 'who', 'what', 'where', 'when', 'why']
      user = robot.brain.userForName(name)
      return msg.reply "#{name} does not exist" unless user?
      user.roles or= []

      if newRole is 'admin'
        msg.reply "Sorry, the 'admin' role can only be removed from the HUBOT_AUTH_ADMIN env variable."
      else
        myRoles = msg.message.user.roles or []
        if msg.message.user.id.toString() in admins
          user.roles = (role for role in user.roles when role isnt newRole)
          msg.reply "Ok, #{name} doesn't have the '#{newRole}' role."

  robot.respond /(what role does|what roles does) @?(.+) (have)\?*$/i, (msg) ->
    name = msg.match[2].trim()
    user = robot.brain.userForName(name)
    return msg.reply "#{name} does not exist" unless user?
    user.roles or= []
    displayRoles = user.roles

    if user.id.toString() in admins
      displayRoles.push('admin')

    if displayRoles.length == 0
      msg.reply "#{name} has no roles."
    else
      msg.reply "#{name} has the following roles: #{displayRoles.join(', ')}."

  robot.respond /who has admin role\?*$/i, (msg) ->
    adminNames = []
    for admin in admins
      user = robot.brain.userForId(admin)
      adminNames.push user.name if user?

    if adminNames.length > 0
      msg.reply "The following people have the 'admin' role: #{adminNames.join(', ')}"
    else
      msg.reply "There are no people that have the 'admin' role."
