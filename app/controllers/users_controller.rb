class UsersController < ApplicationController

  skip_before_action :authorized, only: [:new, :create]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    if logged_in?
      redirect_to user_path(session[:user_id])
    else
      @user = User.new
      render :new
    end
  end

  def create
    user = User.create(user_params)
    if user.valid?
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:errors] = user.errors.full_messages
      redirect_to signup_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)

    redirect_to user_path(user)
  end

  def destroy
    user = User.find(params[:id])
    user.destroy

    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :name, :age, :password)
  end
end
