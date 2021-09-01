# frozen_string_literal: true

class TicketsController < ApplicationController
  before_action :authenticate_user!

  def index
    tickets = policy_scope(Ticket)
    render json: tickets
  end

  def show
    ticket = Ticket.find(params[:id])
    authorize ticket
    render json: ticket
  end

  def create
    if seat_for_screening_is_taken?
      render json: { error: 'Ticket taken' }
    else
      ticket = Ticket.new(ticket_params)
      authorize ticket
      if ticket.save
        render json: ticket, status: :created
      else
        render json: ticket.errors, status: :bad_request
      end
    end
  end

  # I did this so that the seat_for_screening_is_taken doesnt throw error when you try to edit ticket type or price with
  # existing screening and seat id
  # If there is a clearer way to write this feel free to correct me
  def update
    ticket = Ticket.find(params[:id])
    authorize ticket
    if seat_for_screening_is_taken?
      if ticket.screening_id == ticket_params[:screening_id].to_i && ticket.seat_id == ticket_params[:seat_id].to_i
        if ticket.update(ticket_params)
          render json: { success: 'Update successful' }
        else
          render json: ticket.errors
        end
      else
        render json: { error: 'Ticket taken' }
      end
    end
  end

  def delete
    ticket = Ticket.find(params[:id])
    authorize ticket
    if ticket.destroy
      render json: { success: 'Delete successful' }
    else
      render json: ticket.errors
    end
  end

  private

  def ticket_params
    params.permit(:ticket_type, :screening_id, :seat_id)
  end

  def seat_for_screening_is_taken?
    Ticket.exists?(screening_id: ticket_params[:screening_id], seat_id: ticket_params[:seat_id])
  end
end
