class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_number_answers

  scope :correct, -> { where(correct: true) }

  
  private

  def validate_number_answers
    errors.add(:question) if question.answers.count > 3
  end
end
