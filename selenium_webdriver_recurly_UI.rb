#!/usr/bin/env ruby
require 'selenium-webdriver'

# This standalone program will navigate to ReCurly's
# signup page and make some entries

# unless a gemfile is used and bundled,
# first install the following gems at the commandline:
# gem install rubygems
# gem install selenium-webdriver
# gem install chromedriver-helper

driver = Selenium::WebDriver.for :chrome
driver.navigate.to "https://app.recurly.com/signup"

# the element can be found by name or by id
# <input class="Field-input" id="signup_company" name="signup[company]" size="30" type="text" value=" ">
# element = driver.find_element(:name, 'signup[company]')
element = driver.find_element(:id, 'signup_company')

# Future Mod Fix: asking user for a letter to use results in a stale entry error
# puts 'Please enter a letter to use in the submission'
# letter_entry = gets.chomp
# puts 'Thank you.'

letter_entry = 's'

# since blank entry asks only for a single char, do so, in the spirit of TDD:
element.send_keys letter_entry

# Test One: populate a letter entry into all the field ids:
field = ['signup_company', 'signup_first_name', 'signup_last_name',
  'signup_billing_contact_phone', 'signup_password', 'signup_email',
  'signup_subdomain', 'signup_industry', 'signup_estimated_annual_revenue']
field.each do |x|
  element = driver.find_element(:id, x)
  element.send_keys letter_entry
end

# Test Two: leave these commented out until Test One results are viewed
# The selector fields need particular entries,
# yet can also be selected with single letter entries:
element = driver.find_element(:id, 'signup_password')
element.send_keys 'sssssss3'

element = driver.find_element(:id, 'signup_subdomain')
element.send_keys 'sssssss3'

element = driver.find_element(:id, 'signup_email')
element.send_keys 'sue.uyetake3@yahoo.com'

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
puts 'sue.uyetake3.yahoo.com'
puts 'ssssssss3.recurly.com'
puts
result = driver.find_element(:id, 'content')
puts result.text

# comment out the quit so you can see the browser after test run
# ..yet you must manually quit the browser instance later
# driver.quit





# puts ''
# puts "Page Title: #{driver.title}"
# puts "Element of text box used was: #{element.inspect}"
# puts ''

# seek the results and within the element containing lat long
# results = driver.find_element(:id, 'b_results')
# lat_long = results.find_element(:class, 'b_focusTextMedium')

# puts results.inspect
# puts "Here is everything on the return page: "
# puts results.text

# puts lat_long.inspect
# puts ''
# puts 'Here is what you really want to compare:'
# puts lat_long.text


