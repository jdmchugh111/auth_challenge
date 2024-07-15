class UsersController < ApplicationController

  rescue_from ActiveRecord::RecordInvalid, with: :bad_credentials

  def new
    @user = User.new
  end

  def create
    new_user = User.create!(user_params)
    flash[:success] = "Welcome, #{new_user.username}!"
    redirect_to user_path(new_user)
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :email)
  end

  def bad_credentials(exception)
    flash[:alert] = exception.message
    redirect_to register_path
  end
end