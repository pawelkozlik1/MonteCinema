# frozen_string_literal: true

class CinemaHallsService
  def initialize(cinema_hall)
    @cinema_hall = cinema_hall
  end

  def assign_seat_names
    seats_array = create_seats_array
    seats_array.each do |name|
      @cinema_hall.seats.create(name: name)
    end
  end

  private

  def create_seats_array
    rows_name = ('a'..'z').take(@cinema_hall.row_num).to_a
    columns_name = (1..(@cinema_hall.column_num)).to_a
    seats_array = []
    rows_name.each do |i|
      columns_name.each do |j|
        seats_array.append(i + j.to_s)
      end
    end
    seats_array
  end
end
