class Lawyer::QuestionsController < Lawyer::ApplicationController
  before_action :set_question, only: :show

  def show
    authorize! @question
  end

  def new
    authorize! Question
    @question = Question.new
  end

  private

  def set_question
    @question = Question.find(params.expect(:id))
  end
end
