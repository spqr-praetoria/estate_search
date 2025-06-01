class Claimant::PaymentsPolicy < ApplicationPolicy
  def update?
    user.claimant?
  end
end
