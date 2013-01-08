# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

menuState = "closed"

jQuery ->
	$('.btn-menu').click ->
		if menuState == "open"
			$('.menu').animate(left:"-20%", 600)
			$('.btn-menu').animate(left:"0%", 600)
			menuState = "closed"
			console.log "Closed Table"
		else if menuState == "closed"
			$('.menu').animate(left:"0%", 600)
			$('.btn-menu').animate(left:"20%", 600)
			menuState = "open"
			console.log "Open Table"