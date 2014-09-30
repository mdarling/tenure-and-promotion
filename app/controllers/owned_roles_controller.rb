class OwnedRolesController < ApplicationController
  before_action :set_owned_role, only: [:show, :edit, :update, :destroy]

  # GET /owned_roles
  def index
    @user=User.find(params[:user_id])
    @owned_roles = @user.owned_roles.all
  end

  # GET /owned_roles/1
  def show
  end

  # GET /owned_roles/new
  def new
    @user=User.find(params[:user_id])
    counter=0
    @roles=Array.new
    DefaultRole.all.each do |r|
     @roles[counter]=r.role
     counter +=1
    end
    @owned_role = @user.owned_roles.new
  end

  # GET /owned_roles/1/edit
#  def edit
#  end

  # POST /owned_roles
  def create
    @user=User.find(params[:user_id])
    @owned_role = @user.owned_roles.new(owned_role_params)

    if @owned_role.save
      redirect_to user_owned_roles_path, notice: 'Owned role was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /owned_roles/1
  def update
    if @owned_role.update(owned_role_params)
      redirect_to user_owned_roles_path, notice: 'Owned role was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /owned_roles/1
  def destroy
    @owned_role.destroy
    redirect_to user_owned_roles_url, notice: 'Owned role was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_owned_role
      @user = User.find(params[:user_id])
      @owned_role = @user.owned_roles.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def owned_role_params
      params.require(:owned_role).permit(:role, :user_id)
    end
end
