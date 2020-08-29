class BadgeService

  def call
    Badge.find_each do |badge|
      @user.badges.push(badge) if send("#{badge.badge_rule.logic.to_sym}?", badge)
    end
  end

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  private

  def by_category?(badge)
    tests_count = Test.joins(:test_passages).where(test_passages: { done: true, user_id: @user.id },
                                                   category: badge.option).uniq.count
    Category.find_by(title: badge.option).tests.count == tests_count
  end

  def by_first_try?(_badge)
    User.joins(:test_passages).where(test_passages: { user_id: @user.id, test_id: @test.id }).count == 1
  end

  def by_level?(badge)
    test_count = Test.joins(:test_passages).where(test_passages: { done: true, user_id: @user.id },
                                                  level: @test.level).uniq.count
    Test.where(level: badge.option).count == test_count

  end
end
