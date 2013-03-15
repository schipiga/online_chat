OnlineChat.Views.Chatrooms ||= {}

class OnlineChat.Views.Chatrooms.NewView extends Backbone.View
  template: JST['backbone/templates/chatrooms/new']

  el: '#chatrooms_container'

  render: ->
    this.$el.append @template
