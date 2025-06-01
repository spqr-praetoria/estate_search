class Lawyer::DashboardController < Lawyer::ApplicationController
  def index
    authorize! :dashboard
    @title = "Questions"

    # Query: Can a lawyer submit multiple answers to the same question
    @questions = Question.not_closed.order(created_at: :desc)
  end
end
