class SessionsController < ApplicationController
  include SessionsHelper

  skip_before_action :authenticate_user!

  def new

  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      log_in(user)
      redirect_to cookies[:request_path]
    else
      flash.now[:alert] = "Are you Guru? Verify your Email and Password please"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end
end
