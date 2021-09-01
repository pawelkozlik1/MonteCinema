# frozen_string_literal: true

class ScreeningsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    authorize Screening
    screenings = Screening.all
    render json: screenings
  end

  def show
    screening = Screening.find(params[:id])
    authorize screening
    render json: screening
  end

  def create
    screening = Screening.new(screening_params)
    authorize screening
    if screening.save
      render json: screening, status: :created
    else
      render json: screening.errors
    end
  end

  def update
    screening = Screening.find(params[:id])
    authorize screening
    if screening.update(screening_params)
      render json: { success: 'Update successful' }
    else
      render json: screening.errors
    end
  end

  def delete
    screening = Screening.find(params[:id])
    authorize screening
    if screening.destroy
      render json: { success: 'Delete successful' }
    else
      render json: screening.errors
    end
  end

  private

  def screening_params
    params.permit(:movie, :cinema_hall, :screen_time)
  end
end
