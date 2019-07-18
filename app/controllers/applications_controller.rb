class ApplicationsController < ApplicationController
  def new

  end

  def create
    #@user = User.find(params[current_user])
    @job = Job.new(params[:job_id])
    @application = @job.applications.new(application_params)
    if current_user && @job

      if @application.save
        redirect_to application_path
      else
        render 'new'
      end
    end

  end

  def index
  end
  def show
    @jobs = Job.find(params[:job_id])
    @application = Application.find(params[:id])
  end
  private
  def application_params
    params.require(:application).permit(:name, :email, :salary, :about, :comment)
  end

end