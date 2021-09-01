# frozen_string_literal: true

class ScreeningPolicy < ApplicationPolicy
  attr_reader :user, :screening

  def initialize(user, screening)
    super(user)
    @screening = screening
  end

  def create?
    authorized?
  end

  def update?
    authorized?
  end

  def edit?
    authorized?
  end

  def delete?
    authorized?
  end

  private

  def authorized?
    user.manager? || user.employee?
  end
end
