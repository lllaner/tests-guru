class FeedbacksMailer < ApplicationMailer
  def feedback_email(feedback)
    @name = feedback.name
    @message = feedback.message
    @email = feedback.email
    mail from: feedback.email, to: ENV['ADMIN_EMAIL']
  end
end
