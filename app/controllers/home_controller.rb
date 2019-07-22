class HomeController < ApplicationController

  def index
    @jobs = Job.all
  end
  def my_jobs
    #@user = User.find(params[:id])
    @user_jobs = current_user.jobs
  end
end
