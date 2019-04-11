class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @test = test_passage.test
    @user = test_passage.user
  end

  def find_badges
    Badge.all.map { |badge| send("#{badge.rule_type}_rule", badge) }.compact
  end

  private

  def first_pass_rule(badge)
    badge if first_pass?(badge)
  end

  def first_pass?(badge)
    @test_passage.success? && (@user.test_passages.where(test: @test).count == 1) \
                           && (badge.rule_value == @test.id.to_s)
  end

  def category_passed_rule(badge)
    badge if category_passed?(badge)
  end

  def category_passed?(badge)
    tests_count = Test.by_title_category(badge.rule_value).count
    tests_count == 0 ? false : tests_count == @user.passed_tests.by_title_category(badge.rule_value).count
  end

  def level_passed_rule(badge)
    badge if level_passed?(badge)
  end

  def level_passed?(badge)
    tests_count = Test.where(level: badge.rule_value).count 
    tests_count == 0 ? false : tests_count == @user.passed_tests.where(level: badge.rule_value).count
  end

end