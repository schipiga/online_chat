#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.OnlineChat =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}

$ ->
  $('.online_user').on 'click', ->
    @new_chatroom = new OnlineChat.Views.Chatrooms.NewView
    @new_chatroom.render()
