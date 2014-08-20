class ContactController < ApplicationController
  def index
    @user=User.find_by_name(session[:cas_user])
  end
end
