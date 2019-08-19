class InterviewsController < ApplicationController
  before_action :authenticate_user!
  # protect_from_forgery with: :null_session
  def new
    @application = Application.find(params[:application_id])
    @user = @application.user
    @job = @application.job
    # render layout: 'schedule_interviews'
    #debugger
  end
  def set_interview_confiramtion

  end
  def create
    @application = Application.find(params[:application_id])
    @user = @application.user
    app = @application.interview
    @job = @application.job
    #debugger
    #@interviews = Interview.group(:date).count
    #t = Interview.all.select(:date).group_by{|e| e.date.strftime("20%y-%m-%d")}
    #debugger
    @interview = Interview.new(interview_params)
    x = @interview.date
    x = x.to_date
    y = Interview.where(date: x).count

    @interview.application_id = params[:application_id]
   # debugger
    if current_user
      if !app
        if y != 3
        if @interview.save
          JobstatusMailer.interview_schdeule(@user, @application, @interview, @job).deliver
          flash[:alert] = 'Interview has been scheduled and mail is send to the Applicant'
          redirect_to application_interviews_path(@application, @interview)
        else
        render 'new'
        end
        else
          flash[:alert] = 'Three Interviews Already Scheduled for this Date! Please Select another Date'
          render 'new'
          end
      else
        flash[:alert] = 'Interview Already Scheduled'
        redirect_to application_interviews_path(@application, @interview)
       end
    end
  end
  def update
    @interview = Interview.find(params[:id])
    if params[:interview][:status] == "pending"
      x = params[:interview][:date]
      x = x.to_date
      y = Interview.where(:date =>  x).count
      # debugger
      if current_user.role == 'user' || current_user.role == 'employee'
        params[:interview][:interview_confirmation] = true
      end
      if !@interview.interview_confirmation == true
        if y != 3
          if @interview.update(interview_params)
            flash[:alert] = 'Plz come to an interview on time.'
            redirect_to home_my_jobs_path
          else
            flash[:alert] = 'Please Enter again.'
            render 'edit'
          end
        else
          #  debugger
          flash[:alert] = 'Three Interviews Already Scheduled for this Date! Please Select another Date.'
          render 'edit'
        end
      else
        flash[:alert] = 'You have already scheduled an interview.'
        redirect_to home_my_jobs_path
      end
    else
      if @interview.update(interview_params)
        redirect_to interviews_path
      end
    end
  end
  def show
    @interview = Interview.find(params[:id])
  end
  def edit
    @interview = Interview.find(params[:id])
    # render layout: 'schedule_interviews'
  end

  def index
    @interviews = Interview.order(:date)
  end
  private
  def interview_params
    params.require(:interview).permit(:time, :date, :address, :interview_confirmation,:status)
  end
end
