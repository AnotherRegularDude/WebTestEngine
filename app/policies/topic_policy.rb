class TopicPolicy < ApplicationPolicy
  def create?
    user.teacher? || user.administrator?
  end

  def update?
    user.teacher? || user.administrator?
  end
end
