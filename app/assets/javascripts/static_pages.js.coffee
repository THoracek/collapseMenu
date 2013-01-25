# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# Responsive Action
ResponsiveWindowWidth = 767

# $.mobile.loadingMessage = false;

#Menu Characteristics
edgeLocation = "0%"
mobileMenuWidth = "80%"
desktopMenuWidth = "20%"
mobileSiteWidth = "85%"

changeMenuWidth = (e) ->
	if ($(window).width() < ResponsiveWindowWidth)
		$(".menu").data("menuwidth", mobileMenuWidth)
		$('.menu').data('sitewidth', mobileSiteWidth)
		$(".menu").css("width", mobileMenuWidth)
		$(".menu").css("left", "-" + mobileMenuWidth)
		$('.siteContainer').css('left', edgeLocation)
		$('body').css('position', "relative")
		$(".menu").data("state", "closed")

	if ($(window).width() > ResponsiveWindowWidth)
		$(".menu").data("menuwidth", desktopMenuWidth)
		$('.menu').data('sitewidth', desktopMenuWidth)
		$(".menu").css("width", desktopMenuWidth)
		$(".menu").css("left", "-" + desktopMenuWidth)
		$('.siteContainer').css('left', edgeLocation)
		$('body').css('position', "relative")
		$(".menu").data("state", "closed")

jQuery ->
	$(window).bind("load", changeMenuWidth)

	if($(window).width() > ResponsiveWindowWidth)
		$(window).bind("resize", changeMenuWidth)

	# Menu Open/Close Button
	# if ($(window).width() > ResponsiveWindowWidth)
	$('.btn-menu').click ->
		closeSpeed = $('.menu').data('closespeed')
		openSpeed = $('.menu').data('openspeed')
		menuWidth = $('.menu').data('menuwidth')
		edgeLocation = $('.menu').data('edgelocation')
		siteWidth = $('.menu').data('sitewidth')

		if $(".menu").data("state") == "open"
			$('.menu').animate(left:"-" + menuWidth, closeSpeed)
			$('.siteContainer').animate(left:edgeLocation, closeSpeed)
			if ($(window).width() < ResponsiveWindowWidth)
				$('body').css('position', "relative")
			$(".menu").data("state", "closed")

		else if $(".menu").data("state") == "closed"
			$('.menu').animate(left:edgeLocation, openSpeed)
			$('.siteContainer').animate(left:siteWidth, openSpeed)
			if ($(window).width() < ResponsiveWindowWidth)
				$('body').css('position', "fixed")
			$(".menu").data("state", "open")

	# This closes the menu when a link is pressed before loading the next page
	$(".menuLink").click (e) ->
		e.preventDefault()
		$('.siteContainer').animate(
			left: $('.menu').data('edgelocation')
		, $('.menu').data('closespeed'))
		$(".menu").animate
			left: "-" + $('.menu').data('menuwidth')
		, $('.menu').data('closespeed'), ->
			document.location.href = $(".menuLink").attr('href')

	# if ($(window).width() < ResponsiveWindowWidth)
	# 	$(".menu, .siteContainer").on "swipeleft", ->
	# 		console.log("swipe left");
	# 		if $(".menu").data("state") == "open"
	# 			$('.menu').animate left:"-80%", 200
	# 			$('.siteContainer').animate left: "0%", 200
	# 			$('body').css('position', "relative")
	# 			$(".menu").data("state", "closed")

	# 	$(".siteContainer").on "swiperight", ->
	# 		console.log("swipe right" );
	# 		if $(".menu").data("state") == "closed"
	# 			$('.menu').animate left: "0%", 200, ->
	# 				console.log("menu animation finished")
	# 			$('.siteContainer').animate left: "85%", 200, ->
	# 				console.log("siteContainer animation finished")
	# 			$('body').css 'position', "fixed", ->
	# 				console.log("position fixed")
	# 			$(".menu").data "state", "open", ->
	# 				console.log("state open")

	# 	$('.btn-menu').click ->
	# 		if $(".menu").data("state") == "open"
	# 			$('.menu').animate left:"-" + $('.menu').data('menuwidth'), 200, ->
	# 				$('body').css('position', "relative")
	# 				$(".menu").data("state", "closed")
	# 			$('.siteContainer').animate(left: $('.menu').data('edgelocation'), 200)

	# 		else if $(".menu").data("state") == "closed"
	# 			$('.menu').animate left: $('.menu').data('edgelocation'), 200, ->
	# 				$('body').css('position', "fixed")
	# 				$(".menu").data("state", "open")
	# 			$('.siteContainer').animate(left: $('.menu').data('sitewidth'), 200)

maxTime = 1000
maxDistance = 50
startX = 0
startTime = 0
touch = "ontouchend" of document
startEvent = (if (touch) then "touchstart" else "mousedown")
moveEvent = (if (touch) then "touchmove" else "mousemove")
endEvent = (if (touch) then "touchend" else "mouseup")

jQuery ->
	$(".siteContainer").bind startEvent, (e) ->
		console.log('Entering Start Event')
		e.preventDefault()
		startTime = e.timeStamp
		startX = (if e.originalEvent.touches then e.originalEvent.touches[0].pageX else e.pageX)

	$(".siteContainer").bind endEvent, (e) ->
		console.log('Entering End Event')
		startTime = 0
		startX = 0

	$(".siteContainer").bind moveEvent, (e) ->
		console.log('Entering Move Event')
		e.preventDefault()
		currentX = (if e.originalEvent.touches then e.originalEvent.touches[0].pageX else e.pageX)
		currentDistance = (if (startX is 0) then 0 else Math.abs(currentX - startX))
		currentTime = e.timeStamp
		if startTime != 0 && currentTime - startTime < maxTime && currentDistance > maxDistance
			if($(window).width() <= ResponsiveWindowWidth)
				if currentX < startX
					console.log("Swipe Right")
					if $(".menu").data("state") == "open"
						$('.menu').animate(left:"-" + mobileMenuWidth, 200)
						$('.siteContainer').animate(left:edgeLocation, 200)
						$('body').css('position', "relative")
						$(".menu").data("state", "closed")
				if currentX > startX
					console.log("Swipe Left")
					if $(".menu").data("state") == "closed"
						$('.menu').animate(left:edgeLocation, 200)
						$('.siteContainer').animate(left:mobileSiteWidth, 200)
						$('body').css('position', "fixed")
						$(".menu").data("state", "open")