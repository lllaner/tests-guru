class BadgesController < ApplicationController
  before_action :set_badge, only: %i[show]
  def index
    @badges = Badge.all
  end

  def own

  end


  def show; end

  private

  def badge_params
    params.require(:badges).permit(:title, :image)
  end

  def set_badge
    @badge = Badge.find(params[:id])
  end
end
