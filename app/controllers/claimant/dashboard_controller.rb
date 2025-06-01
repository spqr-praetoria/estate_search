class Claimant::DashboardController < Claimant::ApplicationController
  def index
    authorize! :dashboard

    @title = "Questions"
    @questions = current_user.questions.eager_load(:answers).order(created_at: :desc)
  end
end
