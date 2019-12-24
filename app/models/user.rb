class User < ApplicationRecord

  def level_test(level)
      Test.where(level: level).joins('INNER JOIN user_tests ON user_tests.test_id = tests.id').where('user_tests.user_id' => self.id)
  end
end
