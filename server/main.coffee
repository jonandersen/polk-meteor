# use a package so we can verify package auto-stubbing works
root = exports ? this
root.cincoDeMayo = moment("2014-05-05T09:30:30.000").format("MMM, DD YYYY")

Meteor.startup ->
  Messages._ensureIndex({ location : "2dsphere" })
#  if Messages.find().count() is 0
#    messages = ['Ada Lovelace', 'Grace Hopper', 'Marie Curie', 'Carl Friedrich Gauss', 'Nikola Tesla', 'Claude Shannon']
#    messages.forEach (message) ->
#      Messages.insert {message: message }




Meteor.publish 'messages', (location) ->
  #lat: 48.1214502
  #lng: 11.5755302
  console.log(location)
  if (location && location.lng && location.lat)
    return Messages.find {
      location: {
        $near: {
          $geometry: { type: "Point", coordinates: [ location.lng , location.lat ] },
          $maxDistance: 1000
        }
      }
    }


#Meteor.publish 'messages', -> Messages.find()

