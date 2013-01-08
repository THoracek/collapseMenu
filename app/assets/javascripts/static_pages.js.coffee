# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

#Define the menu size here
#Maximum of 85% for iPhone Style Menus
#Minimum of 10% for most applications
menuSize = "20%"

#State of the Menu when you open the webpage
menuState = "closed"

jQuery ->
	$('.btn-menu').click ->
		if menuState == "open"
			$('.menu').animate(left:"-"+menuSize, 600)
			$('.btn-menu').animate(left:"0", 600)
			menuState = "closed"
		else if menuState == "closed"
			$('.menu').animate(left:"0", 600)
			$('.btn-menu').animate(left:menuSize, 600)
			menuState = "open"