# Rails 4.2.4 Asynchrony Labs Code Demo
### Sue Uyetake

This rails app can be played with during Asynchrony Interviews.. 

Right now it will use Recurly's API 
and create an account using a registration
created by the UI selenium tests.

> https://ssssssss7.recurly.com
...
https://ssssssss15.recurly.com

> sue.uyetake7@yahoo.com
...
sue.uyetake15@yahoo.com

> * Test One: create an account in ssssssss7.recurly.com , validate presence_of
> * Test Two: 
> * Test Three: 
> * Test Four: 


Unless the included gemfile is used and bundled,
first install the following gems at the commandline:

> * gem install rubygems
> * gem install recurly
> * gem install selenium-webdriver
> * gem install chromedriver-helper


API INFO: 


Selenium INFO: 

The element under test can be found by name or by id..
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
