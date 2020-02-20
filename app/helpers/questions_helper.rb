module QuestionsHelper
  def question_header(test,question = nil)
  header = question.body.blank? ? "Create new #{test.title} Question" : "Edit #{test.title} Question"
  end
end
