class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP }

  has_many :my_tests, class_name: 'Test', foreign_key: 'author_id'
  has_many :test_passages
  has_many :tests, through: :test_passages

  has_secure_password

  def test_passege(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def level_test(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
