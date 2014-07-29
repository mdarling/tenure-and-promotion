class CollegeAdminViewController < ApplicationController
 
  layout "Review Process"
  def index
  @pagename="Department Admin Home"
  @pagetype=4
  end
  def c
  @pagename="Confidentiality"
  @pagetype=4
  end
  def sac
  @pagename="Select A Candidate"
  @pagetype=4
  end	
  def cd
  @pagename="Candidates Dossier"
  @pagetype=4
  end
  def lor
  @pagename="Letters of Recommendation"
  @pagetype=4
  end
  def ef
  @pagename="Evaluation Form"
  @pagetype=4
  end
  def rav
  @pagename="Review and Vote"
  @pagetype=4
  end
  def login
  @pagename="Login Page"
  @pagetype=4
  end
  def dr
  @pagename="Department Reviews"
  @pagetype=4	
  end
end

