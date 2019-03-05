class Question < ApplicationRecord
  belongs_to :test, autosave: true
  has_many :answers, dependent: :destroy

  validates :body, presence: true
end
