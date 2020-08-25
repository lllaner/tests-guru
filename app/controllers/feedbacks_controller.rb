class FeedbacksController < ApplicationController
  def index
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    if @feedback.save
      FeedbacksMailer.feedback_email(@feedback).deliver_now
      redirect_to root_path, notice: 'Email was delivered'
    else
      render :index
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:name, :email, :message)
  end
end
