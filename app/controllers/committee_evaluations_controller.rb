class CommitteeEvaluationsController < ApplicationController
  before_action :set_committee_evaluation, only: [:show, :edit, :update, :destroy]

  # GET /committee_evaluations
  # GET /committee_evaluations.json
  def index
    @committee_evaluations = CommitteeEvaluation.all
  end

  # GET /committee_evaluations/1
  # GET /committee_evaluations/1.json
  def show
  end

  # GET /committee_evaluations/new
  def new
    @committee_evaluation = CommitteeEvaluation.new
  end

  # GET /committee_evaluations/1/edit
  def edit
  end

  # POST /committee_evaluations
  # POST /committee_evaluations.json
  def create
    @committee_evaluation = CommitteeEvaluation.new(committee_evaluation_params)

    respond_to do |format|
      if @committee_evaluation.save
        format.html { redirect_to @committee_evaluation, notice: 'Committee evaluation was successfully created.' }
        format.json { render action: 'show', status: :created, location: @committee_evaluation }
      else
        format.html { render action: 'new' }
        format.json { render json: @committee_evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /committee_evaluations/1
  # PATCH/PUT /committee_evaluations/1.json
  def update
    respond_to do |format|
      if @committee_evaluation.update(committee_evaluation_params)
        format.html { redirect_to @committee_evaluation, notice: 'Committee evaluation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @committee_evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /committee_evaluations/1
  # DELETE /committee_evaluations/1.json
  def destroy
    @committee_evaluation.destroy
    respond_to do |format|
      format.html { redirect_to committee_evaluations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_committee_evaluation
      @committee_evaluation = CommitteeEvaluation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def committee_evaluation_params
      params.require(:committee_evaluation).permit(:committee_evaluation_id, :committee_id, :committee_department_id, :committee_department_college_id, :review_id, :review_candidate_profile_id)
    end
end
