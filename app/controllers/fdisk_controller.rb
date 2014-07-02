class FdiskController < ApplicationController
  def index
  YourMailer.email_name.deliver
  end
end
