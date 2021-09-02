# frozen_string_literal: true

class CinemaHallPolicy < ApplicationPolicy
  def index?
    manager_or_employee?
  end

  def show?
    manager_or_employee?
  end

  def create?
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
