# frozen_string_literal: true

class Screening < ApplicationRecord
  belongs_to :movie
  belongs_to :cinema_hall
  has_many :tickets, dependent: :destroy
  has_many :reservations, dependent: :destroy
end
