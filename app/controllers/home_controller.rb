class HomeController < ApplicationController
  protect_from_forgery with: :null_session
  def index
    @jobs = Job.all
    @employees = User.where(role: 'employee')
    @salary_sum = User.where(role: 'employee', salary_status: false).sum(:salary)
    @attendance = User.where(role: 'employee', attendance_value: true).count

    # debugger
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
    @users = User.where(role: 'employee', update_profile: true)
    # debugger
    render layout: 'portfolio'
  end
  def AllEmployees
    # render layout: 'portfolio'
    @employees = User.where(role: 'employee')
    # debugger
    render layout: 'employees'
  end
  def salary_history
    @salary_history = current_user.salaries.order(month: :desc)
    render layout: 'salary_history'
  end
  def attendance_history
    @attendance_history = current_user.attendances.order(date: :desc)
    render layout: 'attendance_history'
  end
end
