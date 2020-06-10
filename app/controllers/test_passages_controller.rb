class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def show

  end

  def result

  end

  def gist
    gist = GistQuestionService.new(@test_passage.current_question)
    response = gist.call
    if gist.success?
      flash_options = { notice: response.html_url }
      p 'helloooooooooo'
      p @test_passage.current_question.id
      p current_user.gists.create!(url: response.id, question_id: @test_passage.current_question.id)
    else
      flash_options = { alert: response }
    end

    redirect_to @test_passage, flash_options
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
