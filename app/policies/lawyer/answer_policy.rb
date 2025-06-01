class Lawyer::AnswerPolicy < ApplicationPolicy
  def show?
    user.lawyer?
  end

  def create?
    user.lawyer?
  end
end
