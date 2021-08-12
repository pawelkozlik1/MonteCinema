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
    Movie.create(serialize_movie)
  end

  def update
    movie = Movie.find(params[:id])
    movie.update(serialize_movie)
    render json: { succes: 'Update successful' }
  end

  def delete
    movie = Movie.find(params[:id])
    movie.destroy
    render json: { succes: 'Delete successful' }
  end

  private

  def serialize_movie(movie)
    {
      id: movie.id,
      title: movie.title,
      length: movie.length,
      director: movie.director,
      genre: movie.genre
    }
  end
end
