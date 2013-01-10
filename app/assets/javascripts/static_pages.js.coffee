# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

#State of the Menu when you open the webpage
menuState = "closed"

jQuery ->
	menuWidth = $('.menu').data('menuwidth')
	closeSpeed = $('.menu').data('closespeed')
	openSpeed = $('.menu').data('openspeed')
	edgeLocation = $('.menu').data('edgelocation')

	if $(window).width() < 767
		menuWidth = "80%"

	#Change the menuWidth if it is not default
	$('.menu').css("left", "-"+menuWidth)
	$('.menu').css("width", menuWidth)

	$('.btn-menu').click ->
		if menuState == "open"
			$('.menu').animate(left:"-"+menuWidth, closeSpeed)
			$('.siteContainer').animate(left:edgeLocation, closeSpeed)
			menuState = "closed"
		else if menuState == "closed"
			$('.menu').animate(left:edgeLocation, openSpeed)
			$('.siteContainer').animate(left:menuWidth, openSpeed)
			menuState = "open"