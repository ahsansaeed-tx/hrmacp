class ApplicationsController < ApplicationController
  before_action :authenticate_user!
  # protect_from_forgery with: :null_session
  def new
    @job = Job.find(params[:job_id])
    @application = @job.applications.where(user_id: current_user.id).last
    if @application
      redirect_to home_my_jobs_path
    end
  end

  def create
    #@user = User.find(params[current_user])
    @application = Application.new(application_params)
   # debugger
   #@application << current_user
    @job = Job.find(params[:job_id])
    @application.user  = current_user
    @application.job = @job


    if current_user
      if @application.save
        redirect_to '/home/my_jobs'
      else
        render 'new'
      end
    end

  end

  def index
  end
  def show
    @application = Application.find(params[:id])
  end
  private
  def application_params
    params.require(:application).permit(:name, :email, :salary, :about, :comment, :resume)
  end

end