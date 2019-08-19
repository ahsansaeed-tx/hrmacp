class UsersController < ApplicationController
  protect_from_forgery with: :null_session
  def edit
    @user = User.find(params[:id])
    render layout: 'employee'
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:alert] = 'Profile Has been Updated.'
      redirect_to user_path(@user)
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
    else
      redirect_to root_path
    end
  end

  def destroy
    debugger
  end
  private
  def user_params
    params.require(:user).permit(:name, :university, :slack, :github, :fb, :twitter, :linkedin, :avatar)
  end
end
