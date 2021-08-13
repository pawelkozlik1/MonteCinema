# frozen_string_literal: true

class Movie < ApplicationRecord
  has_many :screenings, dependent: :destroy
end
