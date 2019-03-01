class User < ApplicationRecord
  has_many :completed_tests

  def find_by_level(level)
    Test.where(level: level)
        .joins("JOIN completed_tests ON completed_tests.test_id = tests.id")
        .where("completed_tests.test_id = ?", id)
  end
end
