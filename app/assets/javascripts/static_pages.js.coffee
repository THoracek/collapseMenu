# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# Responsive Action
ResponsiveWindowWidth = 767

# $.mobile.loadingMessage = false;

#Menu Characteristics
edgeLocation = "0%"
mobileMenuWidth = "80%"
negMobileMenuWidth = "-85%"
desktopMenuWidth = "20%"
mobileSiteWidth = "85%"

#Turn on or off touch based menu sliding ("on"/"off")
touchToggle = "off"

maxTime = 1000
maxDistance = 50
startX = 0
startTime = 0
speed = 200
animationState = "done"
closed = "closed"
open = "open"
fixed = "fixed"
relative = "relative"
touch = "ontouchend" of document
startEvent = (if (touch) then "touchstart" else "mousedown")
moveEvent = (if (touch) then "touchmove" else "mousemove")
endEvent = (if (touch) then "touchend" else "mouseup")

changeMenuWidth = (e) ->
	if ($(window).width() < ResponsiveWindowWidth)
		$(".menu").data("menuwidth", mobileMenuWidth)
		$('.menu').data('sitewidth', mobileSiteWidth)
		$(".menu").css("width", mobileMenuWidth)
		$(".menu").css("left", "-" + mobileMenuWidth)
		$('.siteContainer').css 'left', edgeLocation, ->
			$('body').css('position', "relative")
			$(".menu").data("state", "closed")
			animationState = "done"

	if ($(window).width() > ResponsiveWindowWidth)
		$(".menu").data("menuwidth", desktopMenuWidth)
		$('.menu').data('sitewidth', desktopMenuWidth)
		$(".menu").css("width", desktopMenuWidth)
		$(".menu").css("left", "-" + desktopMenuWidth)
		$('.siteContainer').css 'left', edgeLocation, ->
			$('body').css('position', "relative")
			$(".menu").data("state", "closed")
			animationState = "done"

jQuery ->
	$(window).bind("load", changeMenuWidth)

	if($(window).width() > ResponsiveWindowWidth)
		$(window).bind("resize", changeMenuWidth)

	# Menu Open/Close Button
	# if ($(window).width() > ResponsiveWindowWidth)
	$('.btn-menu').click ->
		menuWidth = $('.menu').data('menuwidth')
		edgeLocation = $('.menu').data('edgelocation')
		siteWidth = $('.menu').data('sitewidth')

		if $(".menu").data("state") == "open" && animationState != "inProgress"
			animationState = "inProgress"
			$('.menu').animate(left:"-" + menuWidth, speed)
			$('.siteContainer').animate left:edgeLocation, speed, ->
				if ($(window).width() < ResponsiveWindowWidth)
					$('body').css('position', "relative")
				$(".menu").data("state", "closed")
				animationState = "done"

		else if $(".menu").data("state") == "closed" && animationState != "inProgress"
			animationState = "inProgress"
			$('.menu').animate(left:edgeLocation, speed)
			$('.siteContainer').animate left:siteWidth, speed, ->
				if ($(window).width() < ResponsiveWindowWidth)
					$('body').css('position', "fixed")
				$(".menu").data("state", "open")
				animationState = "done"

	# This closes the menu when a link is pressed before loading the next page
	$(".menuLink").click (e) ->
		e.preventDefault()
		$('.siteContainer').animate(
			left: edgeLocation
		, $('.menu').data('closespeed'))
		$(".menu").animate
			left: "-" + $('.menu').data('menuwidth')
		, $('.menu').data('closespeed'), ->
			document.location.href = $(".menuLink").attr('href')

	if touchToggle == "on"
		$(".siteContainer").bind startEvent, (e) ->
			startTime = e.timeStamp
			startX = (if e.originalEvent.touches then e.originalEvent.touches[0].pageX else e.pageX)

		$(".siteContainer").bind endEvent, (e) ->
			startTime = 0
			startX = 0

		$(".siteContainer").bind moveEvent, (e) ->
			currentX = (if e.originalEvent.touches then e.originalEvent.touches[0].pageX else e.pageX)
			currentDistance = (if (startX is 0) then 0 else Math.abs(currentX - startX))
			currentTime = e.timeStamp
			if startTime != 0 && currentTime - startTime < maxTime && currentDistance > maxDistance && animationState != "inProgress" && $(window).width() < ResponsiveWindowWidth
				if currentX < startX
					if $(".menu").data("state") == open
						animationState = "inProgress"
						$('.menu').animate left:negMobileMenuWidth, speed
						$('.siteContainer').animate left:edgeLocation, speed, ->
							$('body').css "position", relative
							$(".menu").data "state", closed
							animationState = "done"
				if currentX > startX
					if $(".menu").data("state") == closed
						animationState = "inProgress"
						$('.menu').stop().animate left:edgeLocation, speed
						$('.siteContainer').animate left:mobileSiteWidth, speed, ->
							$('body').css "position", fixed
							$(".menu").data "state", open
							animationState = "done" 