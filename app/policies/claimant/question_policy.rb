class Claimant::QuestionPolicy < ApplicationPolicy
  def show?
    user.claimant? && record.user_id == user.id
  end

  def new?
    user.claimant?
  end

  def edit?
    user.claimant? && record.user_id == user.id
  end

  def create?
    user.claimant?
  end

  def update?
    user.claimant? && record.user_id == user.id
  end

  def destroy?
    user.claimant? && record.user_id == user.id
  end
end
