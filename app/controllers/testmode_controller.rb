class TestmodeController < ApplicationController
  def index
    @user=User.find_by_name(session[:cas_user])
    #This layout is "safe" to not crash if the user isn't registered in the app
    render layout: 'newuser'
  end
end
