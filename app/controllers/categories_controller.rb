class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  add_crumb 'Dossier', '/sections'
  # GET /categories
  def index
    @user=context_user
    #Categories each belong to a user
    @categories = @user.categories.select { |category| @user.level == category.level } 
  end

  # GET /categories/1
  def show
    add_crumb @category.name, category_path
  end

  # GET /categories/new
  def new
    add_crumb 'New Section', new_category_path
    @user=context_user
    @category = @user.categories.new
  end

  # GET /categories/1/edit
  def edit
    add_crumb @category.name, category_path
  end

  # POST /categories
  def create
    @user=context_user
    @category = @user.categories.new category_params

    if @category.save
      redirect_to @category, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /categories/1
  def update
    add_crumb @category.name, category_path
    if @category.update category_params
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
      set_user
      @category = @user.categories.find params[:id]
    end

    # Only allow a trusted parameter "white list" through.
    def category_params
      params.require(:category).permit :name, :user_id
    end

    def set_user
      @user = context_user
    end
    
end
