class JobsController < ApplicationController
  before_action :authenticate_user!
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
    @applications = Application.all
    flash[:success] = "Job #{@job.title} has deleted successfully"
    #debugger
    @users.each do |user|
        JobstatusMailer.registration_confirmation(user).deliver
    end
    @job.destroy
    redirect_to '/home/active_jobs'
  end
  private
  def job_params
    params.require(:job).permit(:company_name, :title, :description, :experience)
  end
end
