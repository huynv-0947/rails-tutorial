class SessionsController < ApplicationController
  def new; end

  def create
    sessions = params[:session]
    user = User.find_by email: sessions[:email].downcase
    if user&.authenticate sessions[:password]
      log_in user
      sessions[:remember_me] == "1" ? remember(user) : forget(user)
      redirect_to user
    else
      flash.now[:danger] = t "sessions.new.error_message"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to login_path
  end
end
