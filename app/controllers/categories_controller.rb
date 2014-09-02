class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  def index
    @user=current_user
    @categories = @user.Categories.all
  end

  # GET /categories/1
  def show
  end

  # GET /categories/new
  def new
    @user=current_user
    @category = @user.Categories.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  def create
    @user=current_user
    @category = @user.Categories.new(category_params)

    if @category.save
      redirect_to @category, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /categories/1
  def update
    if @category.update(category_params)
      redirect_to @category, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /categories/1
  def destroy
    @category.destroy
    redirect_to categories_url, notice: 'Category was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @user=current_user
      @category = @user.Categories.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def category_params
      params.require(:category).permit(:name, :user_id)
    end
end
