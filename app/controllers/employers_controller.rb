class EmployersController < ApplicationController
  def edit
    @user = User.find(params[:id])
    render layout: 'employee'
  end

  def update
    @user = User.find(params[:id])

    if current_user.role == 'employee' && @user.update(user_params)
      flash[:alert] = 'Profile Has been Updated.'
      redirect_to employer_path(@user)
    elsif current_user == 'admin' && @user.update(user_params)
      flash[:alert] = 'Salary of #{@user.name} Has been Updated.'
      redirect_to home_AllEmployees_path
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
    elsif current_user == 'admin'
      redirect_to home_AllEmployees_path
    else
      redirect_to root_path
    end
  end

  def destroy
    debugger
  end
  private
  def user_params
    params.require(:user).permit(:name, :university, :slack, :github, :fb, :twitter, :linkedin, :avatar, :salary)
  end
end
