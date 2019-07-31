class JobstatusMailer < ActionMailer::Base
  default :from => "ahsansaeed878@gmail.com"

  def registration_confirmation(user, job, application, interview)
    @user = user
    @job = job
    @application = application
    @interview = interview
    mail(:to => "#{user.role} <#{user.email}>", :subject => "Interview Status")
  end

  def interview_schdeule(user, application, interview, job)
    @application = application
    @user = user
    @interview  = interview
    @job = job
    mail(:to => "#{user.role} <#{user.email}>", :subject => "Interview Schdule")
  end
end

