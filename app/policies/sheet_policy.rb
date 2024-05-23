# frozen_string_literal: true

class SheetPolicy < ApplicationPolicy
  def create?
    true
  end

  def show?
    user.id == record.id
  end

  def update?
    show?
  end

  def destroy?
    show?
  end
end
