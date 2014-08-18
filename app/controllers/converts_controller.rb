class ConvertsController < ApplicationController
  before_action :set_convert, only: [:show, :edit, :update, :destroy]

  # GET /converts
  def index
    @user = User.find(params[:user_id])
    @convert = @user.Converts.all
  end

  # GET /converts/1
  def show
    @user = User.find(params[:user_id])
    @convert = @user.Converts.find(params[:id])
  end

  # GET /converts/new
  def new
    @user = User.find(params[:user_id])
    @convert = @user.Converts.new
  end

  # GET /converts/1/edit
  def edit
    @user = User.find(params[:user_id])
    @convert = @user.Converts.find(params[:id])
  end

  # POST /converts
  def create
    @user = User.find(params[:user_id])
    @convert = @user.Converts.new(convert_params)

    if @convert.save
      redirect_to @convert, notice: 'Convert was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /converts/1
  def update
    @user = User.find(params[:user_id])
    @convert = @user.Converts.find(params[:id])
    if @convert.update(convert_params)
      redirect_to @convert, notice: 'Convert was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /converts/1
  def destroy
    @user = User.find(params[:user_id])
    @convert = @user.Converts.find(params[:id])
    @convert.destroy
    redirect_to converts_url, notice: 'Convert was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_convert
      @user = User.find(params[:user_id])
      @convert = @user.Converts.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def convert_params
      params.require(:convert).permit(:download, :User_id)
    end
end
