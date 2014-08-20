class TestmodeController < ApplicationController
  def index
    @user=User.find_by_name(session[:cas_user])
    render layout: 'newuser'
  end
end
