class HomeController < ApplicationController

  def index
    @jobs = Job.all
    @employees = User.where(role: 'employee')
  end
  def my_jobs
    #@user = User.find(params[:id])
    @user_jobs = current_user.jobs
  end
  def schedule_interview
    @applications = Application.all
  end
  def active_jobs
    @jobs = Job.all
  end
  def all_jobs
    @job = Job.find(params[:job_id])
    @application = current_user.applications.where(job_id: @job.id).last
    @interview = Interview.all
    @app = @application.interview
    #debugger
    if !@app
      @app = Interview.new
    end
    #debugger
  end
  def portfolio
    # render layout: 'portfolio'
    @users = User.where(role: 'employee')
    # debugger
    render layout: 'portfolio'
  end
  def AllEmployees
    # render layout: 'portfolio'
    @employees = User.where(role: 'employee')
    # debugger
    render layout: 'employees'
  end
end
