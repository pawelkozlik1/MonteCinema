# frozen_string_literal: true

class CinemaHallPolicy < ApplicationPolicy
  attr_reader :user, :cinema_hall

  def initialize(user, cinema_hall)
    super(user)
    @cinema_hall = cinema_hall
  end

  def index?
    authorized?
  end

  def show?
    authorized?
  end

  def create?
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
