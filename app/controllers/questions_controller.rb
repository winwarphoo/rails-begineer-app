class QuestionsController < ApplicationController
  def index
    @test = "テスト"
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to("/questions/new")
      flash[:notice] = "成功!"
    else
      flash.now[:alert] = "失敗!"
      render("questions/new")
    end
  end

  private
    def question_params
      params.require(:question).permit(:title, :body)
    end
end
