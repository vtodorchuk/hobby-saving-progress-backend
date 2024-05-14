class UserPolicy < ApplicationPolicy
  def create?
    true
  end

  def show?
    user.id == model.id
  end

  def update?
    show?
  end

  def destroy?
    show?
  end
end
