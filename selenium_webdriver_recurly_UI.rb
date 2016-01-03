#!/usr/bin/env ruby
require 'rubygems'
require 'selenium-webdriver'

# This commandline UI Test program will navigate to Recurly's
# signup page and make some entries.
## Test One: populate nothing to all field ids and simply submit
## Test Two: populate a single letter entry into all the field ids
## Test Three: populate the fields needing more than a single letter entry
## Test Four: confirm page display with accurate number of accounts


# unless a Gemfile is used and bundled,
# first install the following gems at the commandline:
# gem install rubygems
# gem install selenium-webdriver
# gem install chromedriver-helper

# INFO: the element can be found by name or by id
# <input class="Field-input" id="signup_company" name="signup[company]" size="30" type="text" value=" ">
# element = driver.find_element(:name, 'signup[company]')
# element = driver.find_element(:id, 'signup_company')

# TEST SETUPS:
# launch the browser, navigate to signup page
driver = Selenium::WebDriver.for :chrome
driver.navigate.to "https://app.recurly.com/signup"

# initialize field array with ids of all elements to be filled in
# INFO: these ids were discovered manually in chrome browser with "inspect"
field = ['signup_company', 'signup_first_name', 'signup_last_name',
  'signup_billing_contact_phone', 'signup_password', 'signup_email',
  'signup_subdomain', 'signup_industry', 'signup_estimated_annual_revenue']

# set the letter entry and automation numeric iteration below
# since blank entry asks only for a single char, do so, in the spirit of TDD

## Programmatically set the random letter entry and numeric
letter_entry = 's'
numeric = '16'

## ..OR ask user for a letter to use
# puts 'Please enter a letter to use in the signup submission'
# letter_entry = gets.chomp
# puts 'Thank you.'

## set the value to use in vanity url and in password
password_vanity_url = letter_entry*8 + numeric


# TESTS

## Test One: populate nothing to all field ids and simply submit:

# element = driver.find_element(:id, 'signup_company')
# element.submit

## comment out the driver.quit so you can view the browser after test run
## ..yet you must manually quit the browser instance later
# driver.quit

## End of Test One.


## Test Two: populate a single letter entry into all the field ids:
# SETUP: comment out Test One above
# SETUP: change numeric iteration value above
# SETUP: change letter entry value above if desired,
#        or elect to do so at commandline by uncommenting gets code above

# field.each do |x|
#   element = driver.find_element(:id, x)
#   element.send_keys letter_entry
# end
# element.submit

## place summary and results to the commandline at the end of this test:
# puts ''
# puts "Tested Page Title: #{driver.title}"
# puts 'URL: https://app.recurly.com/signup'
# puts ''
# puts 'sue.uyetake' + numeric + '@yahoo.com'
# puts 'https://' + password_vanity_url + '.recurly.com'
# puts
# result = driver.find_element(:id, 'content')
# puts result.text

## comment out the driver.quit so you can view the browser after test run
## ..yet you must manually quit the browser instance later
# driver.quit

## End of Test Two.


# Test Three: populate the fields needing more than a single letter entry:
# SETUP: comment out Test Two above
# SETUP: change numeric iteration value above
# SETUP: change letter entry value above if desired,
#        or elect to do so at commandline by uncommenting gets code above

# INFO: The selector drop-down fields need particular entries,
# yet can also be selected with appropriate single letter entries.

# I found a few minor oddities around the manual keyboard selections:

# BUG1_drop-down: entering the same letter multiple times in dropdown
# will not change the selection to the following entry matching that letter

# BUG2_drop-down: entering a letter will select the nearest alphabetical
# match when that letter does not match the first char of any selections.

# set the values according to the letter entry and numeric of this test
element = driver.find_element(:id, 'signup_password')
element.send_keys password_vanity_url

element = driver.find_element(:id, 'signup_subdomain')
element.send_keys password_vanity_url

element = driver.find_element(:id, 'signup_email')
element.send_keys 'sue.uyetake' + numeric + '@yahoo.com'

element = driver.find_element(:id, 'signup_industry')
element.send_keys 's'

element = driver.find_element(:id, 'signup_estimated_annual_revenue')
element.send_keys 'o'

# set the rest of the values to the single letter entry, not those above
omit_field = ['signup_password', 'signup_email',
  'signup_subdomain', 'signup_industry', 'signup_estimated_annual_revenue']

remaining_field = field.reject { |x| omit_field.include?(x) }

remaining_field.each do |x|
  element = driver.find_element(:id, x)
  element.send_keys letter_entry
end

# submit the above set of values
element.submit

# place summary and results to the commandline at the end of this test:
puts ''
puts "Tested Page Title: #{driver.title}"
puts 'URL: https://app.recurly.com/signup'
puts 'URL: https://app.recurly.com/signup/welcome'
puts ''
puts 'sue.uyetake' + numeric + '@yahoo.com'
puts 'https://' + password_vanity_url + '.recurly.com/signup/welcome'
puts
result = driver.find_element(:id, 'content')
puts result.text

# comment out the quit so you can see the browser after test run
# ..yet you must manually quit the browser instance later
# driver.quit

## end of Test Three.


# Test Four: confirm page display with accurate number of accounts
# SETUP: comment out Test One above
# SETUP: comment out Test Two above
# SETUP: KEEP Test Three above active
# SETUP: change numeric iteration value above
# SETUP: change letter entry value above if desired,
#        or elect to do so at commandline by uncommenting gets code above

# don't need to hit progress link, just go straight to the accounts destination:
# driver.navigate.to "https://#{password_vanity_url}.recurly.com/guides/progress"

driver.navigate.to "https://#{password_vanity_url}.recurly.com/accounts"
account_content = driver.find_element(:class, "Pagination-left" )

# tell tester user the expectations for commandline output:
puts ''
puts 'This is a new user, so expect zero accounts displayed on accounts page:'
puts "https://#{password_vanity_url}.recurly.com/accounts"
puts ''
puts account_content.text

# comment out the quit so you can see the browser after test run
# ..yet you must manually quit the browser instance later
# driver.quit

## end of Test Four.
