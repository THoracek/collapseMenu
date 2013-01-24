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