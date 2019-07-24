class InterviewsController < ApplicationController
  before_action :authenticate_user!
  def new
  end
  def set_interview_confiramtion

  end
  def create
    @application = Application.find(params[:application_id])
    @user = @application.user
    app = @application.interview
    #@interviews = Interview.group(:date).count
    t = Interview.all.select(:date).group_by{|e| e.date.strftime("20%y-%m-%d")}

    @interview = Interview.new(interview_params)
    @interview.application_id = params[:application_id]

    if current_user
      if !app
        if t[@interview.date.to_s].try(:count) != 2
        if @interview.save
          JobstatusMailer.interview_schdeule(@user, @interview, :id).deliver
          flash[:alert] = 'Interview has been scheduled and mail is send to the Applicant'
          redirect_to application_interview_path(:id, @interview)
        else
        render 'new'
        end
        else
          flash[:alert] = 'Three Interviews Already Scheduled for this Date!'
          redirect_to application_interviews_path(:id, @interview)
          end
      else
        flash[:alert] = 'Interview Already Scheduled'
        redirect_to application_interviews_path(:id, @interview)
       end
    end
  end
  def update
    @interview = Interview.find(params[:id])
    if current_user.role == 'user'
      @interview.interview_confirmation = true
      flash[:alert] = 'Plz come to an interview on time.'
    end
    debugger
    if @interview.update(interview_params)
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

  def index
    @interviews = Interview.order(:date)
  end
  private
  def interview_params
    params.require(:interview).permit(:time, :date, :address, :interview_confirmation,:status)
  end
end
