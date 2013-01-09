# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

#Define the menu size here
#85% for iPhone Style Menus
#Minimum of 5% for most applications
menuSize = 20+"%"

#This needs a new name
edgeLocation = 0+"%"

#Speeds menu's open and close
openSpeed = 600
closeSpeed = 600

#State of the Menu when you open the webpage
menuState = "closed"

jQuery ->
	$('.btn-menu').click ->
		if menuState == "open"
			$('.menu').animate(left:"-"+menuSize, closeSpeed)
			$('.container').animate(left:edgeLocation, closeSpeed)
			menuState = "closed"
		else if menuState == "closed"
			$('.menu').animate(left:edgeLocation, openSpeed)
			$('.container').animate(left:menuSize, openSpeed)
			menuState = "open"