class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :publications, class_name: 'Test', foreign_key: "author_id", inverse_of: :author

  validates_each :login, :password, :email do |_record, attr, _value|
    validates attr, presence: true
  end

  def tests_by_level(level)
    tests.where(level: level)
  end
end
