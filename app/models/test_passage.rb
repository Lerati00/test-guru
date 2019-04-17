class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true


  before_validation :before_validation_set_question, on: %i[create update]

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
    (correct_questions.to_f/total_questions * 100).to_i
  end

  def end_time?
    test.timer.present? ? Time.now > created_at + test.timer.minute : false
  end

  private

  def before_validation_set_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answer_count = correct_answer.count

    correct_answer_count == correct_answer.where(id: answer_ids).count &&
    correct_answer_count == answer_ids.to_a.count
  end

  def correct_answer
    current_question.answers.corrected
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.nil? ? 0 : current_question.id).first
  end
end
