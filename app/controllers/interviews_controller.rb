class InterviewsController < ApplicationController
  def new
  end
  def create
    @application = Application.find(params[:application_id])
    @user = @application.user
    @interview = Interview.new(interview_params)
    @interview.application_id = params[:application_id]
    if current_user
      if !Interview.any?

        if @interview.save
          JobstatusMailer.interview_schdeule(@user, @interview, :id).deliver
          flash[:alert] = 'Interview has been scheduled and mail is send to the Applicant'
          redirect_to application_interview_path(:id, @interview)
        else
        render 'new'
        end
      else
        flash[:alert] = 'Interview Already Scheduled'
        redirect_to application_interviews_path(:id, @interview)
      end
    end
  end
  def update
    @interview = Interview.find(params[:id])

    if @interview.update(article_params)
      redirect_to application_interview_path(:id, @interview)
    else
      render 'edit'
    end
  end
  def show
    @interview = Interview.find(params[:id])
  end
  def edit
    @interview = Interview.find(params[:id])
  end
  private
  def interview_params
    params.require(:interview).permit(:time, :date, :address)
  end
end
