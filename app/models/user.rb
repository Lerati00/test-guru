require 'digest/sha1'

class User < ApplicationRecord
  EMAIL_FORMAT = /\A[-a-z0-9!#$%&'*+\/=?^_`{|}~]+(\.[-a-z0-9!#$%&'*+\/=?^_`{|}~]+)*@[a-z0-9][-a-z0-9]{0,61}[a-z0-9]\.(aero|arpa|asia|biz|cat|com|coop|edu|gov|info|int|jobs|mil|mobi|museum|name|net|org|pro|tel|travel|[a-z][a-z])\z/i

  attr_reader :password
  attr_writer :password_comfirmation

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :publications, class_name: 'Test', foreign_key: "author_id", inverse_of: :author

  validates :name, presence: true
  validates :email, uniqueness: true, format: EMAIL_FORMAT

  has_secure_password

  def tests_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(updated_at: :desc).find_by(test_id: test.id)
  end

end
