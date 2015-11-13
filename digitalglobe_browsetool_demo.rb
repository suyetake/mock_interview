#!/usr/bin/env ruby
require 'selenium-webdriver'

# This standalone program will enter coordinates
# to the Digitalglobe imagefinder browsetool
# and seek the display of Westminster, CO

# unless a gemfile is used and bundled,
# first install the following gems at the commandline:
# gem install rubygems
# gem install selenium-webdriver
# gem install chromedriver-helper

driver = Selenium::WebDriver.for :chrome
driver.navigate.to 'https://browse.digitalglobe.com/imagefinder/'
driver.navigate.to 'https://browse.digitalglobe.com/imagefinder/boxmaker.do'

# display the page title at commandline
puts ''
puts "Page Title: #{driver.title}"
puts ''

# find elements
content = driver.find_element(:id, 'content')
center = content.find_element(:name, 'boxMakerCenterPointForm')
lattitude_entry = center.find_element(:name, 'lat')
longitude_entry = center.find_element(:name, 'longitude')
area_entry = center.find_element(:name, 'squareArea')
continue = center.find_element(:name, 'continueButton')

# next enhancement is to seek strips that cover this area
# layout = driver.find_element(:id, 'layout')
# layout_right = layout.find_element(:id, 'layoutRight')

# place entries and submit
lattitude_entry.send_keys '39.83377'
longitude_entry.send_keys '-105.0168'
area_entry.send_keys '100'
continue.submit


# comment out the quit to see the browser after run
# ..yet without this you must manually quit the browser
# driver.quit

