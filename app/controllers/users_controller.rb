class UsersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    login(@user)
    redirect_to user_path(@user.id)
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :email_confirmation, :password, :password_confirmation)
  end

  def find_user
    @user = User.find(params[:id])    
  end
end
