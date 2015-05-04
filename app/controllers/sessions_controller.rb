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
      # how it should be refactored instead of above line, but doesn't work:
      # login(user)
      redirect_to user_path(user.id)
    elsif user == nil
      flash[:error] = "Invalid username or password."
      redirect_to "/login"
    else
      flash[:error] = "Invalid username or password."
      redirect_to "/login"
    end
  end
end
