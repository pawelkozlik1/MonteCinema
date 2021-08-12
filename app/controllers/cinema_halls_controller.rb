# frozen_string_literal: true

class CinemaHallsController < ApplicationController
  def index
    @cinema_halls = CinemaHall.all
    render json: @cinema_halls
  end

  def show
    cinema_hall = CinemaHall.find(params[:id])
    render json: cinema_hall
  end

  def create
    @cinema_hall = CinemaHall.new(cinema_hall_params)
    if [20, 50, 100, 200].include? @cinema_hall.size
      cinema_hall_rows_columns
      if @cinema_hall.save
        render json: @cinema_hall, status: :created
      end
    else
      render json: { error: 'Wrong size' }
    end
  end

  def edit
    @cinema_hall = CinemaHall.find(params[:id])
    if @cinema_hall.update(cinema_hall_params)
      cinema_hall_rows_columns
      render json: { success: 'Update successful' }
    else
      render json: @cinema_hall.errors
    end
  end

  def delete
    cinema_hall = CinemaHall.find(params[:id])
    if cinema_hall.destroy
      render json: { success: 'Delete successful' }
    else
      render json: cinema_hall.errors
    end
  end

  private

  def cinema_hall_rows_columns
    case @cinema_hall.size
    when 20 then assign_column_and_rows(4, 5)
    when 50 then assign_column_and_rows(5, 10)
    when 100 then assign_column_and_rows(10, 10)
    when 200 then assign_column_and_rows(20, 10)
    end
  end

  def assign_column_and_rows(column_num, row_num)
    @cinema_hall.column_num = column_num
    @cinema_hall.row_num = row_num
  end

  def cinema_hall_params
    params.permit(:name, :size)
  end
end
