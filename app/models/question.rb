class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy
  belongs_to :test_passage

  validates :body, presence: true
end
