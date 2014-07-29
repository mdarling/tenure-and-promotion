class CollegeCommitteeFacultyViewController < ApplicationController
  layout "Review Process"
  def index
  @pagename="Department Admin Home"
  @pagetype=5
  end
  def c
  @pagename="Confidentiality"
  @pagetype=5
  end
  def sac
  @pagename="Your Candidate"
  @pagetype=5
  end	
  def cd
  @pagename="Candidates Dossier"
  @pagetype=5
  end
  def lor
  @pagename="Letters of Recommendation"
  @pagetype=5
  end
  def ef
  @pagename="Evaluation Form"
  @pagetype=5
  end
  def rav
  @pagename="Review and Vote"
  @pagetype=5
  end
  def login
  @pagename="Login Page"
  @pagetype=5
  end
  def dr
  @pagename="Department Reviews"
  @pagetype=5	
  end
end