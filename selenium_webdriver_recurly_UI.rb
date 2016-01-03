#!/usr/bin/env ruby
require 'rubygems'
require 'selenium-webdriver'

# This standalone program will navigate to Recurly's
# signup page and make some entries

# unless a Gemfile is used and bundled,
# first install the following gems at the commandline:
# gem install rubygems
# gem install selenium-webdriver
# gem install chromedriver-helper

# the element can be found by name or by id
# <input class="Field-input" id="signup_company" name="signup[company]" size="30" type="text" value=" ">
# element = driver.find_element(:name, 'signup[company]')
# element = driver.find_element(:id, 'signup_company')


driver = Selenium::WebDriver.for :chrome
driver.navigate.to "https://app.recurly.com/signup"
field = ['signup_company', 'signup_first_name', 'signup_last_name',
  'signup_billing_contact_phone', 'signup_password', 'signup_email',
  'signup_subdomain', 'signup_industry', 'signup_estimated_annual_revenue']

## Test One: populate nothing to all field ids and simply submit:
# element = driver.find_element(:id, 'signup_company')
# element.submit

## Next Tests:
## set the automation iteration values here
## since blank entry asks only for a single char, do so, in the spirit of TDD
# letter_entry = 's'

# Future Mod Fix: asking user for a letter to use results in a stale entry error
puts 'Please enter a letter to use in the submission'
letter_entry = gets.chomp
puts 'Thank you.'
numeric = '7'
password_vanity_url = letter_entry*8 + numeric


# Test Two: populate the letter entry into all the field ids:
# field.each do |x|
#   element = driver.find_element(:id, x)
#   element.send_keys letter_entry
# end
# element.submit


# Test Three:
# The selector fields need particular entries,
# yet can also be selected with single letter entries:
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


# submit the above set of values
element.submit

# place summary and results to the commandline at the end of this test:
puts ''
puts "Tested Page Title: #{driver.title}"
puts 'URL: https://app.recurly.com/signup'
puts ''
puts 'sue.uyetake' + numeric + '@yahoo.com'
puts 'https://' + password_vanity_url + '.recurly.com'
puts
result = driver.find_element(:id, 'content')
puts result.text

# comment out the quit so you can see the browser after test run
# ..yet you must manually quit the browser instance later
# driver.quit
