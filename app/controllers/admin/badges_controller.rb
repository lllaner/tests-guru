class Admin::BadgesController < Admin::BaseController
  before_action :set_badge, only: %i[show update edit destroy]
  before_action :set_badge_rules, only: %i[update edit new create destroy]

  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badge_path(@badge), notice: t('.sucess')
    else
      render :index
    end
  end

  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      redirect_to admin_badge_path(@badge), notice: t('.sucess')
    else
      render :index
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path
  end

  private

  def badge_params
    params.require(:badge).permit(:title, :image, :option, :badge_rule_id)
  end

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def set_options
    @options = @badge_rule.build_options
  end
  def set_badge_rules
    @badge_rules = BadgeRule.all.map { |badge_rule| [badge_rule.logic, badge_rule.id]  }
  end

end
