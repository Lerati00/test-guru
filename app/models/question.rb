class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy

  validates :body, presence: true
  validate :validate_min_answers

  def validate_min_answers
    if answers.size < Answer::MINIMUM_ANSWERS
      errors.add(:answer, Answer::MINIMUM_ANSWERS_ERROR)
    end
  end
end
