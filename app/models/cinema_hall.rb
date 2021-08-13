# frozen_string_literal: true

class CinemaHall < ApplicationRecord
  def before_save(record)
    @record = record
    cinema_hall_rows_columns
  end

  private

  def cinema_hall_rows_columns
    case @record.size
    when 20 then assign_column_and_rows(4, 5)
    when 50 then assign_column_and_rows(5, 10)
    when 100 then assign_column_and_rows(10, 10)
    when 200 then assign_column_and_rows(20, 10)
    end
  end

  def assign_column_and_rows(column_num, row_num)
    @record.column_num = column_num
    @record.row_num = row_num
  end
end
