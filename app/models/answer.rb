class Answer < ApplicationRecord
  MAXIMUM_ANSWERS = 4
  MAXIMUM_ANSWERS_ERROR = "Maximum number of answers in question is #{MAXIMUM_ANSWERS}"

  belongs_to :question, optional: true

  scope :corrected, -> { where(correct: true) }

  validates :answer, presence: true
  validate :validate_max_answers, on: :create

  private

  def validate_max_answers
    errors.add(:answer, MAXIMUM_ANSWERS_ERROR)  if question.answers.size > MAXIMUM_ANSWERS
  end
end
