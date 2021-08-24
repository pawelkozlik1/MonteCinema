# frozen_string_literal: true

class ReservationsController < ApplicationController
  def index
    reservations = Reservation.all
    render json: reservations
  end

  def show
    reservation = Reservation.find(params[:id])
    render json: reservation
  end

  def create
    reservation = Reservation.new(reservation_params)
    if reservation.save
      render json: reservation, status: :created
    else
      render json: reservation.errors, status: :bad_request
    end
  end

  def update
    reservation = Reservation.find(params[:id])
    if reservation.update(reservation_params)
      render json: { success: 'Update successful' }
    else
      render json: reservation.errors
    end
  end

  def delete
    reservation = Reservation.find(params[:id])
    if reservation.destroy
      render json: { success: 'Delete successful' }
    else
      render json: movie.errors
    end
  end

  private

  def reservation_params
    params.permit(:status, :ticket_id, :screening_id)
  end
end
