class ApplicationController < ActionController::Base
  protect_from_forgery
  #Require CAS to log in.
  before_filter :cas_filter
  #These methods can be used in views too!
  helper_method :current_user, :super_user, :user_role, :user_admin

  #Put RubyCAS filter in a class, in case it needs to be escaped
 def cas_filter
    RubyCAS::Filter.filter(self)
  end

  #Take the Net ID and find the ActiveRecord object that is made for it
  def current_user
      User.find_by_netid(session[:cas_user]) if User.find_by_netid(session[:cas_user])
  end

  #Pull superusers (tech users) out of a CSV.
  def super_user
    superuser=SmarterCSV.process("superuser.csv")
    superuser.any? {|u| u[:netid] == session[:cas_user]}
  end

  #An easy way to get the user's role
  def user_role
    if current_user
      current_user.role
    end
  end

  #An easy way to determine if the user is an admin
  def user_admin
    super_user || user_role=="Department Admin"
  end
end
