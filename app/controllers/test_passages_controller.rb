class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def show

  end

  def result

  end

  def gist
    gist_service = GistQuestionService.new(@test_passage.current_question)
    if gist_service.errors.any?
      flash_options = { alert: gist_service.errors }
    else
      response = gist_service.call
      flash_options = if gist_service.success?
                        @test_passage.current_question.gists.create(user:current_user, url: response.id)
                        { notice: response.html_url }
                      else
                        { alert: gist_service.errors }
                      end
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
