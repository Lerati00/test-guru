class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  EMAIL_FORMAT = /\A[-a-z0-9!#$%&'*+\/=?^_`{|}~]+(\.[-a-z0-9!#$%&'*+\/=?^_`{|}~]+)*@[a-z0-9][-a-z0-9]{0,61}[a-z0-9]\.(aero|arpa|asia|biz|cat|com|coop|edu|gov|info|int|jobs|mil|mobi|museum|name|net|org|pro|tel|travel|[a-z][a-z])\z/i

  attr_reader :password
  attr_writer :password_comfirmation

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :publications, class_name: 'Test', foreign_key: "author_id", inverse_of: :author
  has_many :gists

  validates :email, uniqueness: true, format: EMAIL_FORMAT

  def tests_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(updated_at: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end

end
