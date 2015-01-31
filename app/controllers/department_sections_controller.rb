class DepartmentSectionsController < ApplicationController
  before_action :set_department_section, only: [:show, :edit, :update, :destroy]

  # GET /department_sections
  def index
    @department_sections = DepartmentSection.all
  end

  # GET /department_sections/1
  def show
  end

  # GET /department_sections/new
  def new
    @department_section = DepartmentSection.new
  end

  # GET /department_sections/1/edit
  def edit
  end

  # POST /department_sections
  def create
    @department_section = DepartmentSection.new(department_section_params)

    if @department_section.save
      redirect_to @department_section, notice: 'Department section was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /department_sections/1
  def update
    if @department_section.update(department_section_params)
      redirect_to @department_section, notice: 'Department section was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /department_sections/1
  def destroy
    @department_section.destroy
    redirect_to department_sections_url, notice: 'Department section was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_department_section
      @department_section = DepartmentSection.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def department_section_params
      params.require(:department_section).permit(:department_id, :section_id)
    end
end
