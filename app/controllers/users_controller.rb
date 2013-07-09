class UsersController < ApplicationController

  skip_before_filter :require_login, :only => [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:current_user_id] = @user.id
      flash[:success] = "You have signed up successfully!"
      redirect_to user_path(@user)
    else
      flash[:error] = @user.errors.full_messages.last
      redirect_to :back
    end
  end

  def show
    @user = User.find(current_user.id)
  end
end