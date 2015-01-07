class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_options, only: [:new, :edit, :index, :create]
  # GET /users
  def index
    @users = User.all
    if user_admin
      #List Users
    elsif current_user
      #Candidates go to categories
      redirect_to categories_path
    else
      #If the person is not in the system, send them back to the license.
      redirect_to root_url
    end
  end

  # GET /users/1
  def show
    add_crumb @user.name, user_path
    if !user_admin
      #If a candidate tries to visit this, send him or her back to categories
      redirect_to categories_path
    end
  end

  # GET /users/new
  def new
    @user = User.new
    if !user_admin
      #If a candidate tries to visit this, send him or her back to categories
      redirect_to root_url
    else
    end
  end

  # GET /users/1/edit
  def edit
    add_crumb @user.name, user_path
    if !user_admin
      #If a candidate tries to visit this, send him or her back to categories
      redirect_to root_url
    else
    end
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path, notice: 'User was successfully created.'
      #Read the categories from the csv file
      categories=SmarterCSV.process('categories.csv')
      categories.each do |c|
        #Create the categories for the candidate
        @user.Categories.create(name: c[:categories])
      end
      set_options
      roles=DefaultRole.all
      @roles=Array.new
      counter = 0
      roles.each do |r|
        if r[:owner]==@user.role
          @user.owned_roles.create(role: r[:role], user: @user)
        end
      end
      Welcome.candidate_mail(recipient: @user).deliver
    else
      #Go back to the page if error
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    add_crumb @user.name, user_path
    if user_admin
      if @user.update(user_params)
        redirect_to @user, notice: 'User was successfully updated.'
      else
        render :edit
      end
    end
  end

  # DELETE /users/1
  def destroy
    if user_admin
      @user.destroy
      redirect_to users_url, notice: 'User was successfully destroyed.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user=User.find(params[:id])
    end
    def set_options
      counter =0
      @roles=Array.new
      #Get roles from the model
      roles=DefaultRole.all
      roles.each do |r|
        #If the current user doesn't own a role, don't show it.
        if r[:owner]==user_role || super_user
          @roles[counter]=r[:role]
          counter += 1
        end
      end
      counter =0
      @departments=Array.new
      departments=SmarterCSV.process('departments.csv')
      departments.each do |d|
        #Allows superuser to select department
        @departments[counter]=d[:department]
        counter += 1
      end
    end
    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:netid, :name, :role, :department)
    end
end
