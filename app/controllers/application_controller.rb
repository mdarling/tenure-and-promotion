class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :cas_filter
 def cas_filter
    RubyCAS::Filter.filter(self)
  end

  def current_user
    if @current_user
      @current_user
    else
      @current_user=session[:cas_user]
    end
  end

end
