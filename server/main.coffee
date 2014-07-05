# use a package so we can verify package auto-stubbing works
root = exports ? this
root.cincoDeMayo = moment("2014-05-05T09:30:30.000").format("MMM, DD YYYY")

Meteor.startup ->
  if Players.find().count() is 0
    names = ['Ada Lovelace', 'Grace Hopper', 'Marie Curie', 'Carl Friedrich Gauss', 'Nikola Tesla', 'Claude Shannon']
    names.forEach (name) ->
      Players.insert {name: name, score: Math.floor (Math.random()*10)*5}
