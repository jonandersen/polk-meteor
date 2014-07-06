Template.messageNew.events 'submit form': (e) ->
  e.preventDefault()

  getPosition (error, lat, lon) ->
    if(error)
      console.log("Failed to get posion")
      return

    message = {
      message: $(e.target).find('[name=message]').val()
      position: {
        lat: lat
        lon: lon
      }
    }
    Meteor.call 'postMessage', message, (error, id) ->
      if (error)
        if (error.error == 302)
          Router.go 'messages', {_id: error.details}
      else
        Router.go 'messages', {_id: id}


