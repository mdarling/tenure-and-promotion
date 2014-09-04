class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :cas_filter
  before_action :current_user
  helper_method :current_user, :super_user
 def cas_filter
    RubyCAS::Filter.filter(self)
  end

  def current_user
    User.find_by_netid(session[:cas_user])
  end

  def super_user
    superuser=SmarterCSV.process("superuser.csv")
    superuser.any? {|u| u[:netid] == session[:cas_user]}
  end

  def department_admin
    departmentadmin=current_user.role=="Department Admin"
  end
end
