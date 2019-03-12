class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_set_next_question, on: :update

  ONE_HUNDERD_PERCENT = 100
  SUCCESS = 85

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    save!
  end

  def completed?
    current_question.nil?
  end

  def number_question
    test.questions.index(current_question) + 1
  end

  def total_questions
    test.questions.count
  end

  def success?
    success_rate >= SUCCESS
  end

  def success_rate
    (correct_questions.to_f/total_questions * ONE_HUNDERD_PERCENT).to_i
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answer_count = correct_answer.count

    correct_answer_count == correct_answer.where(id: answer_ids).count &&
    correct_answer_count == answer_ids.to_a.count
  end

  def correct_answer
    current_question.answers.corrected
  end

  def before_validation_set_next_question
    self.current_question = next_question
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
