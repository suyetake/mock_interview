# Selenium Webdriver 2.0 Ruby Demo
### Sue Uyetake
 
This standalone program will navigate to Recurly's
signup page and make some entries.

unless the included gemfile is used and bundled,
first install the following gems at the commandline:

> gem install rubygems

> gem install selenium-webdriver

> gem install chromedriver-helper





the element can be found by name or by id
input class="Field-input" id="signup_company" name="signup[company]" size="30" type="text" value=" "

> element = driver.find_element(:name, 'signup[company]')

> element = driver.find_element(:id, 'signup_company')

Future Mod Fix: asking user for a letter to use results in a stale entry error

> puts 'Please enter a letter to use in the submission'

> letter_entry = gets.chomp

> puts 'Thank you.'



