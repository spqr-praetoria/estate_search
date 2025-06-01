class Lawyer::DashboardController < Lawyer::ApplicationController
  def index
    authorize! :dashboard
  end
end
