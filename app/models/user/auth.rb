module User::Auth

  extend ActiveSupport::Concern

  included do
    validates :name, presence: true
    validates :email, presence: true
    validates :password, presence: true, if: Proc.new { |u| u.password_digest.blank? } 
    validates :password, confirmation: true
  end

  attr_reader :password
  attr_writer :password_confirmation

  def password=(password_string)
    if password_string.nil?
      self.password_digest = nil
    elsif password_string.present?
      @password = password_string
      self.password_digest = digest(password_string)
    end
  end

  def authenticate(password_string)
    digest(password_string) == self.password_digest ? self : false
  end

  private

  def digest(string)
    Digest::SHA1.hexdigest(string)
  end
end
