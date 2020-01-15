class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true
  validate :validate_number_answers

  private

  def validate_number_answers
    errors.add(:question) if question.answers.count > 3
  end
end
