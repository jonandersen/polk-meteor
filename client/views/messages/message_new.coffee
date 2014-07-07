Template.messageNew.events 'submit form': (e) ->
  e.preventDefault()

  getPosition (error, lng, lat) ->
    if(error)
      console.log("Failed to get postion")
      return

    message = {
      message: $(e.target).find('[name=message]').val()
      location: {
        type: 'Point'
        coordinates:[lng, lat]
      }
    }
    Meteor.call 'postMessage', message, (error, id) ->
      if (error)
        if (error.error == 302)
          Router.go 'messages', {_id: error.details}
      else
        Router.go 'messages', {_id: id}


