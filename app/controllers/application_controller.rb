class ApplicationController < ActionController::Base
  protect_from_forgery
  #Require CAS to log in.
  before_filter :cas_filter
  before_action :mycrumbs
  #These methods can be used in views too!
  helper_method :current_user, :user_role, :user_admin

  #Default Crumbs
  def mycrumbs
    user_admin ? crumbhome = users_path : crumbhome = categories_path
    add_crumb '<i class="fa fa-home"></i>Home'.html_safe, crumbhome
  end

  #Put RubyCAS filter in a class, in case it needs to be escaped
  def cas_filter
    RubyCAS::Filter.filter self
  end

  #Take the Net ID and find the ActiveRecord object that is made for it
  def current_user
    User.find_by_netid session[:cas_user] if User.find_by_netid session[:cas_user]
  end

  #An easy way to get the user's role
  def user_role
    current_user.role if current_user
  end

  #An easy way to determine if the user is an admin
  def user_admin
    user_role.in?  ["Department Admin","College Admin","Tech User"] if user_role
  end

end
