require_relative './selenium_webdriver_demo.rb'

# This tests some aspects of the standalone program
# that enters keywords to a public search engine
# and seeks the lat/long coordinates




## Program under test.. some local variables will
## need to be converted to instance @vars to be accessible..

# driver = Selenium::WebDriver.for :chrome
# driver.navigate.to "http://www.bing.com"
#
## element can be found by name or by id
## element = driver.find_element(:name, 'q')
# element = driver.find_element(:id, 'sb_form_q')
#
## to ensure results, include lat long in the search string
# element.send_keys "Westminster, CO lat long"
# element.submit
#
# puts ''
# puts "Page Title: #{driver.title}"
# puts "Element of text box used was: #{element.inspect}"
# puts ''
#
## seek the results and within the element containing lat long
# results = driver.find_element(:id, 'b_results')
# lat_long = results.find_element(:class, 'b_focusTextMedium')
#
## puts results.inspect
# puts "Here is everything on the return page: "
# puts results.text
#
## puts lat_long.inspect
# puts ''
# puts 'Here is what you really want to compare:'
# puts lat_long.text
#
## comment out the quit to see the browser after run
## ..yet without this you must manually quit the browser
# driver.quit



## future dev to add:
# require 'geocoder'
# and/or gem install geocoder
# geocoded_by :address
# after_validation :geocode


## past development experiments and experiences:
# driver = Selenium::WebDriver.for :chrome
# driver.get "http://localhost:3000"
#
# element = driver.find_element :name => 'authenticity_token'
# use implicit wait ()to poll system for presence before clicking on it)
# element.click('authenticity_token')
# element.send_keys "name value"
# foo = ""
#
# goto my shopping cart display, verify item added is there:
# use bing.com
# text Mark: 720 301 9057
#
# bing.com
# point id the text box
# send keys to text box of a latlong you know
# click on returned frame and store to a variable
# compare variable == to "Westminster"
# use implicit wait to poll system for presence before clicking on it


# driver.get "http://google.com"
#
# element = driver.find_element :name => "q"
# element.send_keys "Cheese!"
# element.submit
#
# puts "Page title is #{driver.title}"
#
# wait = Selenium::WebDriver::Wait.new(:timeout => 10)
# wait.until { driver.title.downcase.start_with? "cheese!" }
#
# puts "Page title is #{driver.title}"
# driver.quit

#You need to require the gem "selenium-driver"
# require "selenium-webdriver"
#
#... see webdriver ruby api docs here: http://selenium.googlecode.com/svn/trunk/docs/api/rb/_index.html
#... Most usefull classes are Driver and Element, check them out for a good start
# driver = Selenium::WebDriver.for :chrome
# driver.navigate.to "http://www.google.com"
# element = driver.find_element(:name, 'q')
# element.send_keys "Hello WebDriver!"
# element.submit
# puts driver.title
# driver.quit
