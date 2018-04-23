class UserPolicy < ApplicationPolicy
  def index
    user.teacher? || user.administrator?
  end

  def update?
    user == record
  end

  def destroy?
    user == record
  end
end
