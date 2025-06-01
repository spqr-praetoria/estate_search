class Lawyer::DashboardPolicy < ApplicationPolicy
  def index?
    user.lawyer?
  end
end
