class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_update :before_update_set_next_question

  PERCENT_RIGTH = 85

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    save!
  end

  def percent_right_answers
    ((self.correct_questions.to_f / self.test.questions.size) * 100).to_i
  end

  def success?
    percent_right_answers >= PERCENT_RIGTH
  end

  def current_number_question
    test.questions.count - test.questions.order(:id).where('id > ?', current_question.id).count
  end

  def all_questions
    test.questions.count
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    answer_ids ||= []
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def before_update_set_next_question
    self.current_question = next_question
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first unless completed?
  end

  def timeout?
    !self.timedown.positive?
  end
end
