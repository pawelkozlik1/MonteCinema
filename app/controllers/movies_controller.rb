# frozen_string_literal: true

class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    render json: @movies
  end

  def show
    movie = Movie.find(params[:id])
    render json: movie
  end

  def create
    Movie.create(movie_params)
  end

  def update
    movie = Movie.find(params[:id])
    if movie.update(movie_params)
      render json: { succes: 'Update successful' }
    else
      render json: errors
    end
  end

  def delete
    movie = Movie.find(params[:id])
    if movie.destroy
      render json: { succes: 'Delete successful' }
    else
      render json: errors
    end
  end

  private

  def movie_params
    params.permit(:id, :title, :length, :director, :genre)
  end
end
