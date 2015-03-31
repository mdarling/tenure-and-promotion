class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :set_user
  before_filter :check_context
  add_crumb 'Dossier', '/sections'
  # GET /categories
  def index
    #Categories each belong to a user
    @categories = @user.categories.select { |category| current_user.role[:level] == category.level } 
    @total = @categories.map{ |c| c.uploads.length}.reduce :+
  end

  # GET /categories/1
  def show
    add_crumb @category.name, category_path
  end

  # GET /categories/new
  def new
    add_crumb 'New Section', new_category_path
    @category = @user.categories.new
  end

  # GET /categories/1/edit
  def edit
    add_crumb @category.name, category_path
  end

  # POST /categories
  def create
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

  def phase_complete
    @user.update phase: @user[:phase] + 1
    session[:context_user] = nil
    redirect_to root_path, notice: 'Thank you! The next phase of review may now begin.'
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
