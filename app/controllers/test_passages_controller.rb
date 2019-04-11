class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def show
  end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def result
    if @test_passage.success?
      @test_passage.update(passed: true) 

      @badge = BadgeService.new(@test_passage).find_badges
      if @badge.present?
        current_user.badges.push(@badge)
        flash[:notice] = t('.add_badge')
      end
    end
  end

  def gist
    question = @test_passage.current_question
    result = GistQuestionService.new(@test_passage.current_question).call
    url = result.html_url

    @gist = current_user.gists.new(question_id: question.id, url: url)

    flash_options = if @gist.save
      { notice: t('.success', url: url) }
    else
      { alert: t('.data_base_error') }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
