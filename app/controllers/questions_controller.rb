class QuestionsController < ApplicationController
  before_action :find_question, only: %i[destroy show edit update]
  before_action :find_test, only: %i[new create destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show

  end

  def new
    @question = Question.new
  end

  def edit

  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render edit_questions_path(@question)
    end
  end

  def destroy
    @question.destroy
    redirect_to @question.test
  end
  
  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to @question
    else
      render new_test_question_path(@question)
    end
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
