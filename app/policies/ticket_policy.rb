# frozen_string_literal: true

class TicketPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.manager? || user.employee?
        scope.all
      else
        scope.where(user: user)
      end
    end
  end

  def show?
    owner_or_staff?
  end

  def create?
    true
  end

  def create_offline?
    manager_or_employee?
  end

  def edit?
    owner_or_staff?
  end

  def delete?
    owner_or_staff?
  end

  private

  def owner_or_staff?
    if user.manager? || user.employee?
      true
    else
      user.id = record.user.id
    end
  end

  def manager_or_employee?
    user.manager? || user.employee?
  end
end
