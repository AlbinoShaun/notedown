# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
	$('#notebook-nav-header').hover( ->
		$(this).children('.delete-button').show()
	, ->
		$(this).children('.delete-button').hide()
	)

	$('#notebook-nav .note-item').hover( ->
		$(this).children('.delete-button').show()
	, ->
		$(this).children('.delete-button').hide()
	)

$(document).ready(ready)
$(document).on('page:load', ready)