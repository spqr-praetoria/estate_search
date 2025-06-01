class Admin::DashboardController < Admin::ApplicationController
  def index
    authorize! :dashboard
  end
end
