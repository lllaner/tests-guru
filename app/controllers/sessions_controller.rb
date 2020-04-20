class SessionsController < ApplicationController

  skip_before_action :authenticate_user!

  def new

  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:request_path] || root_path
    else
      flash.now[:alert] = "Are you Guru? Verify your Email and Password please"
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    cookies[:request_path] = nil
    redirect_to login_path
  end
end
