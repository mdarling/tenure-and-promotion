class AssociateViceProvostFacultyViewController < ApplicationController
layout "Review Process"
def index
    @pagename="Department Admin Home"
    @pagetype=9
end
def c
    @pagename="Confidentiality"
    @pagetype=9
end
def sac
    @pagename="Select A Candidate"
    @pagetype=9
end
def cd
    @pagename="Candidates Dossier"
    @pagetype=9
end
def lor
    @pagename="Letters of Recommendation"
    @pagetype=9
end
def ef
    @pagename="Evaluation Form"
    @pagetype=9
end
def rav
    @pagename="Review and Vote"
    @pagetype=9
end
def login
    @pagename="Login Page"
    @pagetype=9
end
def dr
    @pagename="Department Reviews"
    @pagetype=9
end
def cr
    @pagename="College Reviews"
    @pagetype=9
end
end
