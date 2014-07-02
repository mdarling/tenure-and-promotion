class CandidateProfile < ActiveRecord::Base
	belongs_to :user

  def create
  @CandidateProfile = CandidateProfile.edit(params[:candidate_profile])

  respond_to do |format|
    if @candidate_profile.save
      format.html { redirect_to @user, notice: 'Profile was successfully created.' }
    else
      format.html { render action: "edit" }
    end
  end
end
end
