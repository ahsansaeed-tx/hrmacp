class EmployersController < ApplicationController
  # before_action :authenticate_user!
  protect_from_forgery with: :null_session
  # protect_from_forgery with: :null_session
  def edit
    @user = User.find(params[:id])
    render layout: 'employee'
  end

  def update
    # current_user = User.first
    @user = User.find(params[:id])
    if current_user.nil?
      current_user = User.first
    else
      current_user = @user
    end

    # debugger
    if current_user.role == 'employee'
      params[:user][:update_profile] = true
    end
    if current_user.role == 'employee' && @user.update(user_params)
      flash[:alert] = 'Profile Has been Updated.'
      # debugger
      if params[:user][:attendance_value] == "true"
        a = Attendance.create(:user_id => @user.id, :date => Date.today, :value => @user.attendance_value )
        flash[:alert] = 'Attendance Has been Updated.'
        # initialize
        # a.save
      end
      redirect_to employer_path(@user)
    elsif current_user.role == 'admin' && @user.update(user_params)
      if params[:user][:salary_status] == "true"
        a = Salary.create(:user_id => @user.id, :month => Date.today, :salary => @user.salary )
        # initialize
        # a.save
      end
      # debugger
      flash[:alert] = 'Profile of #{@user.name} Has been Updated.'
      # debugger
      redirect_to employers_path
    else
      flash[:alert] = 'Please Enter again!'
      render 'edit'
    end
  end

  def show
    #debugger
    if params[:id].to_i == current_user.id
      @user = User.find(params[:id])
      render layout: 'employee_show'
    elsif current_user.role == 'admin'
      redirect_to employers_path
    else
      redirect_to root_path
    end
  end

  def destroy
    debugger
  end

  def index
    @employees = User.where(role: 'employee')
    # debugger
    render layout: 'employees'
  end

  private
  def user_params
    params.require(:user).permit(:name, :university, :slack, :github, :fb,
                                 :twitter, :linkedin,
                                 :avatar, :salary, :salary_status, :designation,
                                 :attendance_value, :role, :update_profile)
  end
end
