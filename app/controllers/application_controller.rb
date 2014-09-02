class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :cas_filter
  before_action :current_user
  helper_method :current_user
 def cas_filter
    RubyCAS::Filter.filter(self)
  end

  def current_user
    @current_user=User.find_by_name(session[:cas_user])
    User.find_by_name(session[:cas_user])
  end

end
