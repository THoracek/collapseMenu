# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# Responsive Action
ResponsiveWindowWidth = 767

# #Turn on or off touch based menu sliding ("on"/"off")
# touchToggle = "off"

# #Swipe Variables
# maxTime = 1000
# maxDistance = 50
# startX = 0
# startTime = 0

# touch = "ontouchend" of document
# startEvent = (if (touch) then "touchstart" else "mousedown")
# moveEvent = (if (touch) then "touchmove" else "mousemove")
# endEvent = (if (touch) then "touchend" else "mouseup")

clearMenu = (e) ->
	$(".menu").removeClass "menu-open-mobile"
	$('.siteContainer').removeClass "site-open-mobile"
	$(".menu").removeClass "menu-open-browser"
	$('.siteContainer').removeClass "site-open-browser"
	$('body').css "position", "relative"
	$(".menu").data "state", "closed"
	if ($(window).width() < ResponsiveWindowWidth)
		$('.menu').css "width", "80%"
	else
		$('.menu').css "width", "20%"

closeMenu = (e) ->
	if ($(window).width() < ResponsiveWindowWidth)
		$(".menu").toggleClass "menu-open-mobile"
		$('.siteContainer').toggleClass "site-open-mobile"
	else
		$(".menu").toggleClass "menu-open-browser"
		$('.siteContainer').toggleClass "site-open-browser"
	$(".menu").data "state", "closed"

openMenu = (e) ->
	if ($(window).width() <= ResponsiveWindowWidth)
		$(".menu").toggleClass "menu-open-mobile"
		$('.siteContainer').toggleClass "site-open-mobile"
	else
		$(".menu").toggleClass "menu-open-browser"
		$('.siteContainer').toggleClass "site-open-browser"
	$(".menu").data "state", "open"

jQuery ->
	if ($(window).width() < ResponsiveWindowWidth)
		$('.menu').css "width", "80%"
		$('.siteContainer').css "width", "auto"
		$('.siteContainer').css "position", "relative"
	else
		$('.menu').css "width", "20%"

	$(window).bind("resize", clearMenu)

	# Menu Open/Close Button
	$('.btn-menu').click ->
		if $(".menu").data("state") == "open"
			closeMenu ->
		else if $(".menu").data("state") == "closed"
			openMenu ->

	# #Turn on or off touch based menu sliding ("on"/"off")
	# if touchToggle == "on"
	# 	$(".siteContainer").bind startEvent, (e) ->
	# 		startTime = e.timeStamp
	# 		startX = (if e.originalEvent.touches then e.originalEvent.touches[0].pageX else e.pageX)

	# 	$(".siteContainer").bind endEvent, (e) ->
	# 		startTime = 0
	# 		startX = 0

	# 	$(".siteContainer").bind moveEvent, (e) ->
	# 		currentX = (if e.originalEvent.touches then e.originalEvent.touches[0].pageX else e.pageX)
	# 		currentDistance = (if (startX is 0) then 0 else Math.abs(currentX - startX))
	# 		currentTime = e.timeStamp
	# 		if startTime != 0 && currentTime - startTime < maxTime && currentDistance > maxDistance
	# 			if currentX < startX
	# 				if $(".menu").data("state") == "open"
	# 					closeMenu ->
	# 			if currentX > startX
	# 				if $(".menu").data("state") == "closed"
	# 					openMenu ->