# use a package so we can verify package auto-stubbing works
root = exports ? this
root.cincoDeMayo = moment("2014-05-05T09:30:30.000").format("MMM, DD YYYY")

Meteor.startup ->
  if Messages.find().count() is 0
    messages = ['Ada Lovelace', 'Grace Hopper', 'Marie Curie', 'Carl Friedrich Gauss', 'Nikola Tesla', 'Claude Shannon']
    messages.forEach (message) ->
      Messages.insert {message: message }


Meteor.publish 'messages', -> Messages.find()