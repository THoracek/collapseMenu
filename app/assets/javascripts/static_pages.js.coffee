# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# Responsive Action
ResponsiveWindowWidth = 767

# $(document).bind "mobileinit", ->
#   $.mobile.pushStateEnabled = true

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

	# $(".siteContainer").live "swipeleft", ->
	# 	closeSpeed = $('.menu').data('closespeed')
	# 	menuWidth = $('.menu').data('menuwidth')
	# 	edgeLocation = $('.menu').data('edgelocation')

	# 	if $(".menu").data("state") == "open"
	# 		$('.menu').animate(left:"-" + menuWidth, closeSpeed)
	# 		$('.siteContainer').animate(left:edgeLocation, closeSpeed)
	# 		if ($(window).width() < ResponsiveWindowWidth)
	# 			$('body').css('position', "relative")
	# 		$(".menu").data("state", "closed")

	# $(".siteContainer").live "swiperight", ->
	# 	openSpeed = $('.menu').data('openspeed')
	# 	edgeLocation = $('.menu').data('edgelocation')
	# 	siteWidth = $('.menu').data('sitewidth')

	# 	if $(".menu").data("state") == "closed"
	# 		$('.menu').animate(left:edgeLocation, openSpeed)
	# 		$('.siteContainer').animate(left:siteWidth, openSpeed)
	# 		if ($(window).width() < ResponsiveWindowWidth)
	# 			$('body').css('position', "fixed")
	# 		$(".menu").data("state", "open")