# frozen_string_literal: true

class Ticket < ApplicationRecord
  belongs_to :screening
  belongs_to :seat
  belongs_to :reservation, optional: true
end
