class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :cas_filter
 def cas_filter
    RubyCAS::Filter.filter(self)
  end 
end
