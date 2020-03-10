class Question < ApplicationRecord
  has_many :answers
  belongs_to :test
  before_create :before_create_set_position

  validates :body, presence: true

  private

  def before_create_set_position
    self.position = self.test.questions.size
  end
end
