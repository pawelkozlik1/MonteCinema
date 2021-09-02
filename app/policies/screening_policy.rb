# frozen_string_literal: true

class ScreeningPolicy < ApplicationPolicy
  def create?
    manager_or_employee?
  end

  def update?
    manager_or_employee?
  end

  def edit?
    manager_or_employee?
  end

  def delete?
    manager_or_employee?
  end

  private

  def manager_or_employee?
    user.manager? || user.employee?
  end
end
