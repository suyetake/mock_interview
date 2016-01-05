# these are the API tests
class ApitestsController < ApplicationController

  # when no registration is known, assign a default known one for test usage:
  def index
    @default_password_vanity = 'ssssssss8'
    @password_vanity_url = 'https://' + @default_password_vanity + '.recurly.com/accounts'
  end

  # test user may assign a registration directly by typing it into the url:
  # localhost:3000/registration/ssssssss10
  def assign
    password_vanity = params[:vanity_url]
    @password_vanity_url = 'https://' + password_vanity + '.recurly.com/accounts'
  end
end
