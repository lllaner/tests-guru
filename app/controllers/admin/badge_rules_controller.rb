class Admin::BadgeRulesController < Admin::BaseController
  before_action :set_badge_rule, only: %i[show edit update destroy]

  def index
    @badge_rules = BadgeRule.all
  end

  def new
    @badge_rule = BadgeRule.new
  end

  def create
    @badge_rule = BadgeRule.new(badge_rule_params)
    if @badge_rule.save
      redirect_to admin_badge_rule_path(@badge_rule), notice: 'Badge rule was successfully created'
    else
      render :new
    end
  end

  def update
    if @badge_rule.update(badge_rule_params)
      redirect_to admin_badge_rule_path(badge_rule), notice: 'Badge rule was successfully updated'
    else
      render :new
    end
  end

  def destroy
    @badge_rule.destroy
    redirect_to admin_badge_rules_path
  end

  private

  def badge_rule_params
    params.require(:badge_rule).permit(:logic)
  end

  def set_badge_rule
    @badge_rule = BadgeRule.find(params[:id])
  end


end
