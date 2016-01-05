# these are the API tests
class ApitestsController < ApplicationController

  # when no registration is known, assign a default known one for test usage:
  # def index
  #   @default_password_vanity = 'ssssssss11'
  #   @password_vanity_url = 'https://' + @default_password_vanity + '.recurly.com/accounts'
  # end

  # TROUBLESHOOTING..ODD..
  # substituded this when the index method did not seem to create a class instance needed for the api call
  def initialize
    @default_password_vanity = 'ssssssss11'
    @password_vanity_url = 'https://' + @default_password_vanity + '.recurly.com/accounts'
  end

  # test user may assign a registration directly by typing it into the url:
  # localhost:3000/registration/ssssssss10
  def assign
    password_vanity = params[:vanity_url]
    @password_vanity_url = 'https://' + password_vanity + '.recurly.com/accounts'
  end

  # use Recurly API to create an account associated with this registered user:
  def api_create_account

    # this gem could not be found nor loaded when placed in Gemfile, so omit for now..
    # require 'rubygems'
    require 'recurly'

    account = Recurly::Account.create(
      :account_code => '1',
      :email => 'verena@example.com',
      :first_name => 'Verena',
      :last_name => 'Example'
    )
  end
end
