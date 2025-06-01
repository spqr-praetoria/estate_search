class Claimant::DashboardPolicy < ApplicationPolicy
  def index?
    user.claimant?
  end
end
