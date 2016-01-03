# Selenium Webdriver 2.0 Ruby Demo
### Sue Uyetake
 
This commandline program will navigate to Recurly's
signup page and make some entries.

> * Test One: populate nothing to all field ids and simply submit
> * Test Two: populate a single letter entry into all the field ids
> * Test Three: populate the fields needing more than a single letter entry
> * Test Four: confirm page display with accurate number of accounts


Unless the included gemfile is used and bundled,
first install the following gems at the commandline:

> * gem install rubygems
> * gem install selenium-webdriver
> * gem install chromedriver-helper

INFO: The element under test can be found by name or by id..
( input class="Field-input" id="signup_company" name="signup[company]" size="30" type="text" value=" " )

> * element = driver.find_element(:name, 'signup[company]')
> * element = driver.find_element(:id, 'signup_company')

Fixed Test: asking user for a letter to use resulted in a stale entry error, okay now.
> * puts 'Please enter a letter to use in the submission'
> * letter_entry = gets.chomp
> * puts 'Thank you.'

Noted in Test Three:
> * BUG1_drop-down: entering the same letter multiple times in dropdown
will not change the selection to the following entry matching that letter

> * BUG2_drop-down: entering a letter will select the nearest alphabetical
match when that letter does not match the first char of any selections.
