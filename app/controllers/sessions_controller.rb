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
      login(user)
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
