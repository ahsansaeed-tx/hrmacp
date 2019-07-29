class ApplicationsController < ApplicationController
  before_action :authenticate_user!
  def new
    @job = Job.find(params[:job_id])
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