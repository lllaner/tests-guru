class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]
  before_action :set_gist_service, only: %i[gist]

  def show

  end

  def result

  end

  def gist
    if @gist_service.autheticate
      response = @gist_service.call
      if @gist_service.success?
        flash_options = { notice: response.html_url }
        begin
          current_user.gists.create!(url: response.id, question_id: @test_passage.current_question.id)
        rescue StandartError => e
          flash_options = { alert: e.message }
        end
      else
        flash_options = { alert: @gist_service.errors }
      end
    else
      flash_options = { alert: @gist_service.errors }
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

  def set_gist_service
    @gist_service = GistQuestionService.new(@test_passage.current_question)
  end
end
