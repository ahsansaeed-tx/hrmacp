class JobsController < ApplicationController
  before_action :authenticate_user!
  # protect_from_forgery with: :null_session
  def new

  end
  def index
    @jobs = Job.all
  end
  def create
    @job = Job.new(job_params)
    if (@job.save)
      redirect_to '/home/active_jobs'
    else
      render 'new'
    end
  end
  def show
  @job = Job.find(params[:id])
  end
  def destroy

    @job = Job.find(params[:id])
    @users = @job.users
    @interviews = Interview.all

    flash[:alert] = "Job #{@job.title} has deleted successfully"
    #debugger
    @users.each do |user|
        @application = user.applications.where(job_id: @job.id).last
        @interview = @interviews.where(application_id: @application.id).last
        if @interview.present?
        JobstatusMailer.registration_confirmation(user, @job, @application, @interview).deliver
          end
    end
    @job.destroy
    redirect_to '/home/active_jobs'
  end
  private
  def job_params
    params.require(:job).permit(:company_name, :title, :description, :experience)
  end
end
