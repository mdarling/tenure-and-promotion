class ProvostAdminViewController < ApplicationController

layout "Review Process"
def index
    @pagename="Department Admin Home"
    @pagetype=6
end
def c
    @pagename="Confidentiality"
    @pagetype=6
end
def sac
    @pagename="Select A Candidate"
    @pagetype=6
end
def cd
    @pagename="Candidates Dossier"
    @pagetype=6
end
def lor
    @pagename="Letters of Recommendation"
    @pagetype=6
end
def ef
    @pagename="Evaluation Form"
    @pagetype=6
end
def rav
    @pagename="Review and Vote"
    @pagetype=6
end
def login
    @pagename="Login Page"
    @pagetype=6
end
def dr
    @pagename="Department Reviews"
    @pagetype=6
end
def cr
    @pagename="College Reviews"
    @pagetype=6
end
end


