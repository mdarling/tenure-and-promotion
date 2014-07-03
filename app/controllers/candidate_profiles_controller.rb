class CandidateProfilesController < ApplicationController
  before_action :set_candidate_profile, only: [:show, :edit, :update, :destroy]

  # GET /candidate_profiles
  # GET /candidate_profiles.json
  def index
    @candidate_profiles = CandidateProfile.all
  end

  # GET /candidate_profiles/1
  # GET /candidate_profiles/1.json
  def show
  end

  # GET /candidate_profiles/new
  def new
    @candidate_profile = CandidateProfile.new
  end

  # GET /candidate_profiles/1/edit
  def edit
  end

  # POST /candidate_profiles
  # POST /candidate_profiles.json
  def create
    @candidate_profile = CandidateProfile.new(candidate_profile_params)

    respond_to do |format|
      if @candidate_profile.save
        format.html { redirect_to @candidate_profile, notice: 'Candidate profile was successfully created.' }
        format.json { render action: 'show', status: :created, location: @candidate_profile }
      else
        format.html { render action: 'new' }
        format.json { render json: @candidate_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /candidate_profiles/1
  # PATCH/PUT /candidate_profiles/1.json
  def update
    respond_to do |format|
      if @candidate_profile.update(candidate_profile_params)
        format.html { redirect_to users_path, notice: 'Candidate profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @candidate_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candidate_profiles/1
  # DELETE /candidate_profiles/1.json
  def destroy
    @candidate_profile.destroy
    respond_to do |format|
      format.html { redirect_to candidate_profiles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_candidate_profile
      @candidate_profile = CandidateProfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def candidate_profile_params
      params.require(:candidate_profile).permit(:candidate_profile_id, :Curriculum_Vitae, :Teaching_Statement, :Research_Statement, :Service_statement_in, :Additional_Materials, :user_id, :User_department_id)
    end
end
