class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def show

  end

  def result

  end

  def gist
    gist_service = GistQuestionService.new(@test_passage.current_question)
    flash_options = if gist_service.success?
                      response = gist_service.call
                      @test_passage.current_question.gists.create(user:current_user, url: response.id)
                      { notice: response.html_url }
                    else
                      { alert: gist_service.errors }
                    end

    redirect_to @test_passage, flash_options
  end

  def update
    binding.pry
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.expired? || @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      if @test_passage.success?
        @test_passage.update(done: true)
        BadgeService.new(@test_passage).call
      end
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
