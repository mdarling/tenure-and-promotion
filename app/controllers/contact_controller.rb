class ContactController < ApplicationController
  def index
    add_crumb "Contact Us", contact_path
    @user=current_user
  end
end
