@getPosition = (callback) ->
  if(navigator.geolocation)
    navigator.geolocation.getCurrentPosition (position) ->
      callback(undefined, position.coords.longitude, position.coords.latitude)
  else
    callback(error, undefined, undefined)