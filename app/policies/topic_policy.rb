class TopicPolicy < ApplicationPolicy
  def create?
    user.teacher? || user.administrator?
  end
end
