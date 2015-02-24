class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_options, only: [:new, :edit, :index, :create]
  add_crumb "Faculty", '/users' 
  # GET /users
  def index
    # If the person is not in the system, send them back to the license.
    redirect_to root_path unless current_user
    department=current_user.department
    role=current_user.role
    if role.candidate?
      # Candidates go to categories
      redirect_to categories_path
    elsif role.department?
      # List Users within department
      @users=User.all.select { |u| department==u.department }
    elsif role.college?
      # List Users within college
      @users=User.all.select { |u| department.college==u.department.college }
    elsif role.provost?
      # List all Users
      @users=User.all
    end
  end

  # GET /users/1
  def show
    add_crumb @user.name, user_path
    unless user_admin
      #If a candidate tries to visit this, send him or her back to categories
      redirect_to categories_path
    end
  end

  # GET /users/new
  def new
    @user = User.new
    #If a candidate tries to visit this, send him or her back to categories
    redirect_to root_url if current_user.role.candidate? 
  end

  # GET /users/1/edit
  def edit
    add_crumb @user.name, user_path
    #If a candidate tries to visit this, send him or her back to categories
    redirect_to root_url if current_user.role.candidate?
  end

  # POST /users
  def create
    @user = User.new user_params

    if @user.save
      redirect_to users_path, notice: 'User was successfully created.'
      #Read the categories from the database
      sections=@user.department.department_sections
      sections.each do |section|
        #Create the categories for the candidate
        @user.categories.create name: section.section.name
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
    #if user_admin
      if @user.update user_params
        redirect_to @user, notice: 'User was successfully updated.'
      else
        render :edit
      end
    #end
  end

  # DELETE /users/1
  def destroy
    if user_admin
      @user.destroy
      redirect_to users_url, notice: 'User was successfully destroyed.'
    end
  end

  def contextualize
    user = User.find params[:user_id]
    if current_user.role.department? && user.department == current_user.department or
       current_user.role.college? && user.college == current_user.college or
       current_user.role.provost? and
       current_user.role.level == user.phase
      session[:context_user] = user
      redirect_to categories_path, notice: "Working in context of #{user.name}"
    else
      redirect_to users_path
      flash[:error] = 'This user is not available'
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user=User.find params[:id]
  end

  def set_options
    @roles=Role.all
    @departments=Department.all
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit :netid, :name, :role_id, :department_id
  end

end
