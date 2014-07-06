class @MessagesListController extends RouteController
  onBeforeAction: ->
  # do some stuff before the action is invoked

  onAfterAction: ->
  # do some stuff after the action is invokedze

  template: 'messages'

  waitOn: Meteor.subscribe('messages');

  data: -> messages: Messages.find()



class @MessageNewController extends RouteController
  onBeforeAction: ->
    # do some stuff before the action is invoked

  onAfterAction: ->
    # do some stuff after the action is invokedze
  waitOn: Meteor.subscribe('messages');

  data: -> messages: Messages.find()

  template: 'messageNew'