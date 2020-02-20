class QuestionsController < ApplicationController
  before_action :find_question, only: [:destroy, :show, :edit]
  before_action :find_test, only: [:new, :create, :edit]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show
    @question
  end

  def new
    @question = Question.new
    model = [@test,@question]
  end

  def edit
    @question
    @model = [@question]
  end

  def destroy
    @question.destroy
    redirect_to "/tests/#{@question.test_id}/questions"
  end
  
  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to @question
    else
      render :new
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
    @test =  @question.nil? ? Test.find(params[:test_id]) : @question.test  

  end

  def question_params
    params.require(:question).permit(:body)
  end
end
