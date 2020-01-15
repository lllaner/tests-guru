class User < ApplicationRecord
  has_many :my_tests, class_name: "Test", foreign_key: "author_id"
  has_and_belongs_to_many :tests

  validates :name, presence: true
  validates :email, presence: true

  def level_test(level)
    tests.where(level: level)
  end
end
