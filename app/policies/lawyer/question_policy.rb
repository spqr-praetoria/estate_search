class Lawyer::QuestionPolicy < ApplicationPolicy
  def show?
    user.lawyer?
  end

  def new?
    user.lawyer?
  end
end
