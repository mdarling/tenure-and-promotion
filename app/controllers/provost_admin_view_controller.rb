class ProvostAdminViewController < ApplicationController

layout "Review Process"
def index
    @pagename="Department Admin Home"
end
def c
    @pagename="Confidentiality"
end
def sac
    @pagename="Select A Candidate"
end
def cd
    @pagename="Candidates Dossier"
end
def lor
    @pagename="Letters of Recommendation"
end
def ef
    @pagename="Evaluation Form"
end
def rav
    @pagename="Review and Vote"
end
def login
    @pagename="Login Page"
end
def dr
    @pagename="Department Reviews"
end
def cr
    @pagename="College Reviews"
end
end


