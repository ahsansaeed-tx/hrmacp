class JobstatusMailer < ActionMailer::Base
  default :from => "ahsansaeed878@gmail.com"

  def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.role} <#{user.email}>", :subject => "Interview Status")
  end

  def interview_schdeule(user, interview, id)
    @interview = interview
    @user = user
    @id  = id
    mail(:to => "#{user.role} <#{user.email}>", :subject => "Interview Schdule")
  end
end

