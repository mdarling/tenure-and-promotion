class WelcomePreview
  def candidate_mail
    current_user=User.find_by_netid(session[:cas_user])
    Welcome.candidate_mail(recipient: current_user)
  end
end
