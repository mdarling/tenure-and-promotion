class Welcome < ActionMailer::Base

  def candidate_mail(recipient: nil)
    #This instance variable is used to carry over to the template
    @candidate = recipient
    mail :subject => "Welcome to UNM Tenure and Promotion, #{mailname}",
    :to => "#{recipient.netid}@unm.edu",
    :from_name => "UNM Tenure and Promotion",`
    :from => "tp@unm.edu"
  end

end
