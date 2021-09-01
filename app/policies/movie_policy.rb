# frozen_string_literal: true

class MoviePolicy < ApplicationPolicy
  attr_reader :user, :movie

  def initialize(user, movie)
    super(user)
    @movie = movie
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
