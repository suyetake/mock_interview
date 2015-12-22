#!/usr/bin/env ruby
require 'selenium-webdriver'

# This standalone program will enter keywords
# to a public search engine and seek the lat/long coordinates

# unless a gemfile is used and bundled,
# first install the following gems at the commandline:
# gem install rubygems
# gem install selenium-webdriver
# gem install chromedriver-helper

driver = Selenium::WebDriver.for :chrome
driver.navigate.to "http://www.bing.com"

# element can be found by name or by id
# element = driver.find_element(:name, 'q')
element = driver.find_element(:id, 'sb_form_q')

# to ensure results, include lat long in the search string
element.send_keys "Westminster, CO lat long"
element.submit

puts ''
puts "Page Title: #{driver.title}"
puts "Element of text box used was: #{element.inspect}"
puts ''

# seek the results and within the element containing lat long
results = driver.find_element(:id, 'b_results')
lat_long = results.find_element(:class, 'b_focusTextMedium')

# puts results.inspect
puts "Here is everything on the return page: "
puts results.text

# puts lat_long.inspect
puts ''
puts 'Here is what you really want to compare:'
puts lat_long.text


# comment out the quit to see the browser after run
# ..yet without this you must manually quit the browser
# driver.quit
