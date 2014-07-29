class SeniorViceProvostViewController < ApplicationController
layout "Review Process"
def index
    @pagename="Department Admin Home"
    @pagetype=8
end
def c
    @pagename="Confidentiality"
    @pagetype=8
end
def sac
    @pagename="Select A Candidate"
    @pagetype=8
end
def cd
    @pagename="Candidates Dossier"
    @pagetype=8
end
def lor
    @pagename="Letters of Recommendation"
    @pagetype=8
end
def ef
    @pagename="Evaluation Form"
    @pagetype=8
end
def rav
    @pagename="Review and Vote"
    @pagetype=8
end
def login
    @pagename="Login Page"
    @pagetype=8
end
def dr
    @pagename="Department Reviews"
    @pagetype=8
end
def cr
    @pagename="College Reviews"
    @pagetype=8
end
end
