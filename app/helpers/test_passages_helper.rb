module TestPassagesHelper
  def percent_right_answers
    percent = (@test_passage.correct_questions.to_f / @test_passage.test.questions.size.to_f)*100
  end
end
