class UsersController < ApplicationController
  before_action :logged_in?, only: [:index, :show]
  
  def index
    @users = User.all
    render :index
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    user_params = params.require(:user)
    user = User.confirm(user_params[:username], user_params[:password])
    if user
      login(user)
      redirect_to user_path(user.id)
    end
  end

  def follow
    user = User.find(params[:id])

    if current_user == user
        flash[:error] = "You can't follow yourself!"
      else
        current_user.follow(user)
        flash[:notice] = "You are now following #{user.username}!"
        redirect_to "/users"
    end
  end

  def unfollow
    user = User.find(params[:id])

    current_user.stop_following(user)
    flash[:notice] = "You are no longer following #{user.username}."
    redirect_to "/users"
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def find_user
    @user = User.find(params[:id])    
  end

end
