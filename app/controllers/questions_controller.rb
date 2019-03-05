class QuestionsController < ApplicationController
  before_action :find_test
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
  end

  def show
  end

  def new
  end

  def create
    @question = @test.questions.create(question_attribute)
    redirect_to test_question_path(@test, @question)
  end

  def destroy
    @question.destroy
    redirect_to test_questions_path
  end

  private

  def question_attribute
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id]) 
  end

  def rescue_with_question_not_found
    render plain: "Question not found!"
  end
end
