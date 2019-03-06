class PagesController < ApplicationController
  skip_before_action :authorized, only: [:landing]

  def landing
    if logged_in?
      redirect_to user_path(current_user.id)
    else
      render 'landing'
    end
  end

end
