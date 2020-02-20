class UserMailer < ApplicationMailer
  default from: 'iifunnymomen@gmail.com'
  def welcome_email
    mail(to: 'ilanercode@gmail.com', subject: 'Welcome to My Awesome Site')
  end

end
