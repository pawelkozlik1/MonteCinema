# frozen_string_literal: true

class Screening < ApplicationRecord
  belongs_to :movie
  belongs_to :cinema_hall
  has_many :tickets
end
