class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :publications, class_name: 'Test', foreign_key: "author_id", inverse_of: :author

  validates :login, :password, :email, presence: true

  def tests_by_level(level)
    tests.where(level: level)
  end
end
