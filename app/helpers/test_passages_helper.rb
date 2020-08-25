module TestPassagesHelper
  def position_number
    "#{@test_passage.current_number_question} / #{@test_passage.all_questions}"
  end

  def progress
    ((@test_passage.current_number_question.to_f - 1) / @test_passage.all_questions * 100).to_i
  end
end
