class YourMailer < ActionMailer::Base
  def email_name
    mail :subject => "Mandrill rides the Rails!",
         :to      => "fdisk@fdisk.co",
         :from    => "fdisk@fdisk.fdisk"
  end
end