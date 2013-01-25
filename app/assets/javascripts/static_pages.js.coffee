# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# Responsive Action
ResponsiveWindowWidth = 767

#Menu Characteristics
edgeLocation = "0%"
mobileMenuWidth = "80%"
negMobileMenuWidth = "-85%"
desktopMenuWidth = "20%"
mobileSiteWidth = "85%"

#Turn on or off touch based menu sliding ("on"/"off")
touchToggle = "on"

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

jQuery ->

	# Menu Open/Close Button
	$('.btn-menu').click ->

		if $(".menu").data("state") == "open"
			if ($(window).width() < ResponsiveWindowWidth)
				$(".menu").toggleClass("menu-open-mobile");
				$('.siteContainer').toggleClass("site-open-mobile");
				$('body').css "position", relative
			else
				$(".menu").toggleClass("menu-open-browser");
				$('.siteContainer').toggleClass("site-open-browser");
			$(".menu").data "state", closed

		else if $(".menu").data("state") == "closed"
			if ($(window).width() < ResponsiveWindowWidth)
				$(".menu").toggleClass("menu-open-mobile");
				$('.siteContainer').toggleClass("site-open-mobile");
				$('body').css "position", fixed
			else
				$(".menu").toggleClass("menu-open-browser");
				$('.siteContainer').toggleClass("site-open-browser");
			$(".menu").data "state", open

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
			if startTime != 0 && currentTime - startTime < maxTime && currentDistance > maxDistance
				if currentX < startX
					if $(".menu").data("state") == open
						if ($(window).width() < ResponsiveWindowWidth)
							$(".menu").toggleClass("menu-open-mobile");
							$('.siteContainer').toggleClass("site-open-mobile");
							$('body').css "position", relative
						else
							$(".menu").toggleClass("menu-open-browser");
							$('.siteContainer').toggleClass("site-open-browser");
						$(".menu").data "state", closed
				if currentX > startX
					if $(".menu").data("state") == closed
						if ($(window).width() < ResponsiveWindowWidth)
							$(".menu").toggleClass("menu-open-mobile");
							$('.siteContainer').toggleClass("site-open-mobile");
							$('body').css "position", fixed
						else
							$(".menu").toggleClass("menu-open-browser");
							$('.siteContainer').toggleClass("site-open-browser");
						$(".menu").data "state", open