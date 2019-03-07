module TestsHelper
  def test_level(test)
    level = test.level
    if level.between?(0, 3)
      %w[easy elementary advanced hard][level] 
    else
      "hard"
    end
  end
end
