class OwnBadgesController < ApplicationController
  def index
    @badges = current_user.count_own_badges
  end
end
