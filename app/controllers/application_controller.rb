class ApplicationController < ActionController::Base
  protect_from_forgery
  #Require CAS to log in.
  before_filter :cas_filter
  before_action :mycrumbs, :agreement
  #These methods can be used in views too!
  helper_method :current_user, :user_role, :user_admin, :context_user

  #Default Crumbs
  def mycrumbs
    add_crumb '<i class="fa fa-home"></i>Home'.html_safe, root_path 
  end

  #Put RubyCAS filter in a class, in case it needs to be escaped
  def cas_filter
    RubyCAS::Filter.filter self
  end

  #Redirect to license page if you haven't already been there
  def agreement
    redirect_to license_path unless session[:agreement]
    session[:agreement]=true
  end

  #Take the Net ID and find the ActiveRecord object that is made for it
  def current_user
    User.find_by_netid session[:cas_user] if User.find_by_netid session[:cas_user]
  end

  def context_user
    session[:context_user] ? User.find(session[:context_user]) : current_user
  end

  #An easy way to get the user's role
  def user_role
    current_user.role if current_user
  end

  #An easy way to determine if the user is an admin
  def user_admin
    user_role.in?  ["Department Admin","College Admin","Tech User"] if user_role
  end

  def check_context
    unless context_user.phase == current_user.role.level
      redirect_to root_path
      flash[:error] = "This dossier is currently at the #{context_user.phase} review phase."
    end
  end

end
