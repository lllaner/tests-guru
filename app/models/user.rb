class User < ApplicationRecord
  has_many :my_tests, class_name: "Test", foreign_key: "author_id"
  has_and_belongs_to_many :tests
  def level_test(level)
      Test.where(level: level).joins('INNER JOIN user_tests ON user_tests.test_id = tests.id').where('user_tests.user_id' => self.id)
  end
end
