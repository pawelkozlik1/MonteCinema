# frozen_string_literal: true

class CinemaHallsController < ApplicationController
  def index
    cinema_halls = CinemaHall.all
    render json: cinema_halls
  end

  def show
    cinema_hall = CinemaHall.find(params[:id])
    render json: cinema_hall
  end

  def create
    cinema_hall = CinemaHall.new(cinema_hall_params)
    if [20, 50, 100, 200].include? cinema_hall.size
      before_save(cinema_hall)
      render json: cinema_hall, status: :created if cinema_hall.save
    else
      render json: { error: 'Wrong size' }
    end
  end

  def edit
    cinema_hall = CinemaHall.find(params[:id])
    if cinema_hall.update(cinema_hall_params)
      before_save(cinema_hall)
      render json: cinema_hall, status: :created if cinema_hall.save
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

  def cinema_hall_params
    params.permit(:name, :size)
  end
end