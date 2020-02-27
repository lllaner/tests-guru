module QuestionsHelper
  def question_header(question)
  header = question.new_record? ? "Create new #{@test.title} Question" : "Edit #{@test.title} Question"
  end
end
