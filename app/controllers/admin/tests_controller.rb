class Admin::TestsController < Admin::BaseController
  before_action :authenticate_user!
  before_action :find_test, only: %i[show edit destroy start]
  before_action :set_categories, only: %i[edit new create]

  def index
    @tests = Test.all
  end

  def show

  end

  def new
    @test = current_user.my_tests.new
  end

  def create
    @test = current_user.my_tests.new(test_params)
    if @test.save
      redirect_to admin_test_path(@test), notice: t('.success')
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path(@test), notice: t('.success')
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def set_categories
    @categories = Category.all.map { |category| [category.title, category.id]  }
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
