# frozen_string_literal: true

class Reservation < ApplicationRecord
  has_many :tickets, dependent: :destroy
  belongs_to :screening
end
