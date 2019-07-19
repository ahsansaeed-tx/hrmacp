class JobstatusMailer < ActionMailer::Base
  default :from => "ahsansaeed878@gmail.com"

  def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.role} <#{user.email}>", :subject => "Registration Confirmation")
  end
end