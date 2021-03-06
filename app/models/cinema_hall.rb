# frozen_string_literal: true

class CinemaHall < ApplicationRecord
  has_many :screenings, dependent: :destroy
  has_many :seats, dependent: :destroy
  before_save :assign_cinema_hall_column_and_rows

  private

  def assign_cinema_hall_column_and_rows
    case size
    when 20 then assign_column_and_rows(4, 5)
    when 50 then assign_column_and_rows(5, 10)
    when 100 then assign_column_and_rows(10, 10)
    when 200 then assign_column_and_rows(20, 10)
    end
  end

  def assign_column_and_rows(column_num, row_num)
    self.column_num = column_num
    self.row_num = row_num
  end
end
