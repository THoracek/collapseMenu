# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

menuState = "closed"

jQuery ->
	$('.btn-menu').click ->
		if menuState == "open"
<<<<<<< HEAD
			$('.menu').hide('slide', direction: 'left', 600)
			$('.btn-menu').css(left:"0%")
			menuState = "closed"
			console.log "Open Table"
		else if menuState == "closed"
			$('.menu').show('slide', direction: 'left', 600)
			$('.btn-menu').css(left:"20%")
=======
			$('.menu').animate(left:"-20%", 600)
			$('.btn-menu').animate(left:"0%", 600)
			menuState = "closed"
			console.log "Closed Table"
		else if menuState == "closed"
			$('.menu').animate(left:"0%", 600)
			$('.btn-menu').animate(left:"20%", 600)
>>>>>>> Open and close Generic Sidebar
			menuState = "open"
			console.log "Open Table"