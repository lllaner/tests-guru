module TestPassagesHelper
  def position_number
    "#{@test_passage.current_number_question} / #{@test_passage.all_questions}"
  end
end
