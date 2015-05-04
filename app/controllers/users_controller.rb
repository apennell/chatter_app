class UsersController < ApplicationController
  before_action :logged_in?, only: [:show]
  
  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    user_params = params.require(:user)
    user = User.confirm(user_params[:username], user_params[:password])
    if user
      session[:user_id] = user.id
      # how it should be refactored instead of above line, but doesn't work:
      # login(user)
      redirect_to user_path(user.id)
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def find_user
    @user = User.find(params[:id])    
  end
end
