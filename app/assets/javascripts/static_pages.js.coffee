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
		$('body').css('position', "relative")
		$(".menu").data("state", "closed")

	if ($(window).width() > 767)
		$(".menu").data("menuwidth", "20%")
		$('.menu').data('sitewidth', "20%")
		$(".menu").css("width", "20%")
		$(".menu").css("left", "-20%")
		$('.siteContainer').css('left', "0%")
		$('body').css('position', "relative")
		$(".menu").data("state", "closed")

#State of the Menu when you open the webpage
$(".menu").data("state", "closed")

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
			if ($(window).width() < 767)
				$('body').css('position', "relative")
			$(".menu").data("state", "closed")
			
		else if $(".menu").data("state") == "closed"
			$('.menu').animate(left:edgeLocation, openSpeed)
			$('.siteContainer').animate(left:siteWidth, openSpeed)
			if ($(window).width() < 767)
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