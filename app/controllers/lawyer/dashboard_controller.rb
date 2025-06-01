class Lawyer::DashboardController < Lawyer::ApplicationController
  def index
    authorize! :dashboard
    @title = "Questions"

    # Query: Can a lawyer submit multiple answers to the same question
    # I've made it so that it's 1 question per lawyer
    @questions = Question.not_closed.order(created_at: :desc)
  end
end
