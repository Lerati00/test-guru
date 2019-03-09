class QuestionsController < ApplicationController
  before_action :find_test, only: %w[index new create]
  before_action :find_question, only: %i[show destroy edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = @test.questions.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def create
    @question = @test.questions.new(params_question)

    if @question.save
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  def update
    @question = Question.find(params[:id])

    if @question.update(params_question)
      redirect_to question_path(@question)
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to test_path(@question.test)
  end

  private

  def params_question
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    redirect_to '/404/'
  end
end
