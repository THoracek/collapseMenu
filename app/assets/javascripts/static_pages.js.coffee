# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# Responsive Action
changeMenuWidth = (e) ->
	if ($(window).width() < 767)
		$(".menu").data("menuwidth", "80%")
		$('.menu').data('sitewidth', "85%")
		$(".menu").css("width", "80%")
		$(".menu").css("left", "-80%")
		$('.siteContainer').css('left', "0%")

	if ($(window).width() > 767)
		$(".menu").data("menuwidth", "20%")
		$('.menu').data('sitewidth', "20%")
		$(".menu").css("width", "20%")
		$(".menu").css("left", "-20%")
		$('.siteContainer').css('left', "0%")

#State of the Menu when you open the webpage
menuState = "closed"

jQuery ->
	if ($(window).width() < 767)
		$(".menu").data("menuwidth", "80%")
		$('.menu').data('sitewidth', "85%")
		$(".menu").css("width", "80%")
		$(".menu").css("left", "-80%")
		$('.siteContainer').css('left', "0%")

	if ($(window).width() > 767)
		$(".menu").data("menuwidth", "20%")
		$('.menu').data('sitewidth', "20%")
		$(".menu").css("width", "20%")
		$(".menu").css("left", "-20%")
		$('.siteContainer').css('left', "0%")

	if($(window).width() > 600)
		$(window).bind("resize", changeMenuWidth)

	$('.btn-menu').click ->
		closeSpeed = $('.menu').data('closespeed')
		openSpeed = $('.menu').data('openspeed')
		menuWidth = $('.menu').data('menuwidth')
		edgeLocation = $('.menu').data('edgelocation')
		siteWidth = $('.menu').data('sitewidth')

		if menuState == "open"
			$('.menu').animate(left:"-" + menuWidth, closeSpeed)
			$('.siteContainer').animate(left:edgeLocation, closeSpeed)
			$('body').css('position', "relative")
			menuState = "closed"
		else if menuState == "closed"
			$('.menu').animate(left:edgeLocation, openSpeed)
			$('.siteContainer').animate(left:siteWidth, openSpeed)
			$('body').css('position', "fixed")
			menuState = "open"