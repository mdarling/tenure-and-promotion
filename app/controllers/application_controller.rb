class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :cas_filter
  helper_method :current_user
 def cas_filter
    RubyCAS::Filter.filter(self)
  end

  def current_user
    User.find_by_name(session[:cas_user])
  end

end
