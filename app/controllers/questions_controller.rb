class QuestionsController < ApplicationController
  before_action :find_test, only: [:new, :create]
  before_action :find_question, only: [:destroy, :show]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    questions = Question.where(test_id: params[:test_id]).pluck(:body)
    render plain: questions.join("\n")
  end

  def show
    
  end

  def new
    
  end

  def destroy
    @question.destroy
    redirect_to "/tests/#{@question.test_id}/questions"
  end
  def create
    question = @test.questions.create(question_params)
    render plain: question.inspect
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Question not found'
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
