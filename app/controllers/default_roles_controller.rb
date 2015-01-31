class DefaultRolesController < ApplicationController
  before_action :set_default_role, only: [:show, :edit, :update, :destroy]

  # GET /default_roles
  def index
    @default_roles = DefaultRole.all
  end

  # GET /default_roles/1
  def show
  end

  # GET /default_roles/new
  def new
    @default_role = DefaultRole.new
  end

  # GET /default_roles/1/edit
  def edit
  end

  # POST /default_roles
  def create
    @default_role = DefaultRole.new default_role_params

    if @default_role.save
      redirect_to @default_role, notice: 'Default role was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /default_roles/1
  def update
    if @default_role.update default_role_params
      redirect_to @default_role, notice: 'Default role was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /default_roles/1
  def destroy
    @default_role.destroy
    redirect_to default_roles_url, notice: 'Default role was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_default_role
      @default_role = DefaultRole.find params[:id]
    end

    # Only allow a trusted parameter "white list" through.
    def default_role_params
      params.require(:default_role).permit :role, :owner
    end
end
