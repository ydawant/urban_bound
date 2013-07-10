class SessionsController < ApplicationController

  skip_before_filter :require_login

  def new
    @session = current_user || User.new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:current_user_id] = user.id
      flash[:success] = "You successfully logged in!"
      redirect_to user_path(user)
    else
      flash[:error] =  "Unsuccessful login. Please try again."
      redirect_to root_path
    end
  end

  def logout
    session.clear
    redirect_to root_path
  end

end
