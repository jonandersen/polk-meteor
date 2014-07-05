Template.leaderboard.players = ->
  Players.find {}, {sort: {score: -1, name: 1}}

Template.leaderboard.selected_name = ->
  player = Players.findOne Session.get 'selected_player'
  player and player.name

Template.player.selected = ->
  if Session.equals('selected_player', @_id) then 'selected' else ''

Template.leaderboard.events
  'click input.inc': ->
    Players.update Session.get('selected_player'), {$inc: {score: 5}}

Template.player.events
  'click': ->
    Session.set 'selected_player', @_id