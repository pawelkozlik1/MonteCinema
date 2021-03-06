# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
  has_many :reservations, dependent: :destroy

  def employee?
    user.role == 'employee'
  end

  def manager?
    user.role == 'manager'
  end

  def client?
    user.role == 'client'
  end
end
