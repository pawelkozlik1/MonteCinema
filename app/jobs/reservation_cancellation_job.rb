class ReservationCancellationJob < ApplicationJob
  queue_as :default

  def perform(reservations)
    reservation = reservations.find(params[:id])
    if reservation.destroy
      render json: { success: 'Delete successful' }
    else
      render json: movie.errors
    end
  end
end
