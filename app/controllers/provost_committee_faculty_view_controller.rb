class ProvostCommitteeFacultyViewController < ApplicationController
  layout "Review Process"
def index
    @pagename="Department Admin Home"
    @pagetype=7
end
def c
    @pagename="Confidentiality"
    @pagetype=7
end
def sac
    @pagename="Select A Candidate"
    @pagetype=7
end
def cd
    @pagename="Candidates Dossier"
    @pagetype=7
end
def lor
    @pagename="Letters of Recommendation"
    @pagetype=7
end
def ef
    @pagename="Evaluation Form"
    @pagetype=7
end
def rav
    @pagename="Review and Vote"
    @pagetype=7
end
def login
    @pagename="Login Page"
    @pagetype=7
end
def dr
    @pagename="Department Reviews"
    @pagetype=7
end
def cr
    @pagename="College Reviews"
    @pagetype=7
end
end
