@Messages = new Meteor.Collection 'messages'

Messages.allow
  insert: (userId, doc) ->
    !!userId

Meteor.methods
  postMessage: (postAttributes) ->
    user = Meteor.user()
    if(!user)
      throw new Meteor.Error(401, "You need to login to post new messages")
    if(!postAttributes.message)
      throw new Meteor.Error(422, 'Please fill in a message')

    message = _.extend(_.pick(postAttributes, 'message', 'location'), {
      userId: user._id,
      author: user.username,
      submitted: new Date().getTime()
    })

    messageId = Messages.insert(message)
    return messageId

