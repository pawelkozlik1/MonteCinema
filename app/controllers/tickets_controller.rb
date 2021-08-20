# frozen_string_literal: true

class TicketsController < ApplicationController
  def index
    tickets = Ticket.all
    render json: tickets
  end

  def show
    ticket = Ticket.find(params[:id])
    render json: ticket
  end

  def create
    ticket = Ticket.new(ticket_params)
    if Ticket.where.not(Ticket.screening.id = ticket.screening.id, Ticket.seat.name = ticket.seat.name)
      if ticket.save
        render json: ticket, status: :created
      else
        render json: ticket.erros, status: :bad_request
      end
    end
  end

  def update
    ticket = Ticket.find(params[:id])
    if Ticket.where.not(Ticket.screening.id = ticket.screening.id, Ticket.seat.name = ticket.seat.name)
      if ticket.update(ticket_params)
        render json: { success: 'Update successful' }
      else
        render json: ticket.errors
      end
    end
  end

  def delete
    ticket = Ticket.find(params[:id])
    if ticket.destroy
      render json: { success: 'Delete successful' }
    else
      render json: ticket.errors
    end
  end

  private

  def ticket_params
    params.permit(:type, :price)
  end
end
