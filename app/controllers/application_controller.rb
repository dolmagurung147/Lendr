class ApplicationController < ActionController::Base

  before_action :authorized
  helper_method :current_user, :logged_in?, :my_payment

  def current_user
    if session[:user_id]
      @user =  User.find_by(id: session[:user_id])
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    redirect_to login_path unless logged_in?
  end

  def my_payment(user, debt)
    Payment.find_by(user_id: user.id, debt_id: debt.id)
  end

end
