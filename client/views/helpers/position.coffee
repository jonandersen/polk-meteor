@getPosition = (callback) ->
  if(navigator.geolocation)
    navigator.geolocation.getCurrentPosition (position) ->
      callback(undefined, position.coords.latitude, position.coords.longitude)
  else
    callback(error, undefined, undefined)