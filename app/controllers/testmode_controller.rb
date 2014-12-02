class TestmodeController < ApplicationController
  add_crumb "License", "/"
  def index
    #@user=User.find_by_name(session[:cas_user])
    #This layout is "safe" to not crash if the user isn't registered in the app
    #render layout: 'newuser'
  end
  def logout
    RubyCAS::Filter.logout(self)
  end
end
