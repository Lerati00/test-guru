class Admin::TestsController < Admin::BaseController
  before_action :find_test, only: %i[show destroy edit update start]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def show
    @questions = @test.questions
  end

  def new
    @test = Test.new
  end

  def edit
  end

  def create
    @test = current_user.publications.new(test_params)

    if @test.save
      redirect_to admin_test_path(@test)
    else
      flash[:alert] = "Are you a Guru? Verify yuor Email and password please."
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path(@test)
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end

  private

  def test_params
    params.require(:test).permit(:title, :level)
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def rescue_with_test_not_found
    redirect_to '/404/'
  end
end
