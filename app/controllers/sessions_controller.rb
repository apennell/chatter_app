class SessionsController < ApplicationController
  def new
  end

  def destroy
    logout()
    redirect_to "/"
  end

  def create
    user_params = params.require(:user)
    user = User.confirm(user_params[:username], user_params[:password])
    if user
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      redirect_to "/login"
    end
  end
end
