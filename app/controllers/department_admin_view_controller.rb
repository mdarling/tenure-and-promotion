class DepartmentAdminViewController < ApplicationController
  
  layout "Review Process"
  def index
  @pagename="Department Admin Home"
  @pagetype=2
  end
  def c
  @pagename="Confidentiality"
  @pagetype=2
  end
  def sac
  @pagename="Select A Candidate"
  @pagetype=2
  end	
  def cd
  @pagename="Candidates Dossier"
  @pagetype=2
  end
  def lor
  @pagename="Letters of Recommendation"
  @pagetype=2
  end
  def ef
  @pagename="Evaluation Form"
  @pagetype=2
  end
  def rav
  @pagename="Review and Vote"
  @pagetype=2
  end
  def login
  @pagename="Login Page"
  @pagetype=2
  end
end
