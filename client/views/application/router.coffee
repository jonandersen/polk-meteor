Router.configure layoutTemplate: 'layout'


Router.map ->
  @route 'home', path: '/'
  @route 'messages',
          path: '/messages'
          controller: "MessagesListController"


