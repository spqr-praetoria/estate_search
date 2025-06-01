class Claimant::DashboardController < Claimant::ApplicationController
  def index
    authorize! :dashboard
  end
end
