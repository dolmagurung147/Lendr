class SessionsController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]

  def new
    if !logged_in?
      render :new
    else
      redirect_to user_path(current_user)
    end
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:notice] = 'Invalid username or password'
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to landing_path
  end

end
