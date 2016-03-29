# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
socket = new Pusher('c271d10e2915f1884cf7')
channel = socket.subscribe('main')
channel.bind 'article_created', (data) ->
  alert('pusher')
  $('#pusher-box').text(data)


$(document).on 'click', '#pusher-box', ->
  alert('clicked')
  $('#pusher-box').text('')