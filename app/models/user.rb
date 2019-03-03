class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :publications, class_name: 'Test', foreign_key: "author_id", inverse_of: :author

  def find_by_level(level)
    tests.where(level: level)
  end
end
