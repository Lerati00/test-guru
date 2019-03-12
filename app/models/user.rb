require 'digest/sha1'

class User < ApplicationRecord
  include Auth

  attr_reader :password
  attr_writer :password_comfirmation

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :publications, class_name: 'Test', foreign_key: "author_id", inverse_of: :author

  has_secure_password

  def tests_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(updated_at: :desc).find_by(test_id: test.id)
  end

end
