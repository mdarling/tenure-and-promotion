class CollegeAdminViewController < ApplicationController
  def index
  end
  layout "Review Process"
  def index
  @pagename="Department Admin Home"
  @pagetype=3
  end
  def c
  @pagename="Confidentiality"
  @pagetype=3
  end
  def sac
  @pagename="Select A Candidate"
  @pagetype=3
  end	
  def cd
  @pagename="Candidates Dossier"
  @pagetype=3
  end
  def lor
  @pagename="Letters of Recommendation"
  @pagetype=3
  end
  def ef
  @pagename="Evaluation Form"
  @pagetype=3
  end
  def rav
  @pagename="Review and Vote"
  @pagetype=3
  end
  def login
  @pagename="Login Page"
  @pagetype=3
  end
  def dr
  @pagename="Department Reviews"
  @pagetype=3	
  end
end

