# frozen_string_literal: true

class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    reservations = policy_scope(Reservation)
    render json: reservations
  end

  def show
    reservation = Reservation.find(params[:id])
    authorize reservation
    render json: reservation
  end

  def create
    authorize Reservation
    reservation_db = Reservation.joins(:screening)
    reservation = reservation_db.new(reservation_params)
    if reservation.save
      render json: reservation, status: :created
    else
      render json: reservation.errors, status: :bad_request
    end
    ReservationCancellationJob.set(wait_until: reservation.screening.screen_time - 30.minutes).perform_later(reservation.id)
  end

  def update
    reservation = Reservation.find(params[:id])
    authorize reservation
    if reservation.update(reservation_params)
      render json: { success: 'Update successful' }
    else
      render json: reservation.errors
    end
  end

  def delete
    reservation = Reservation.find(params[:id])
    authorize reservation
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
