# frozen_string_literal: true

class Seat < ApplicationRecord
  belongs_to :cinema_hall
  has_many :tickets, dependent: :destroy
end
