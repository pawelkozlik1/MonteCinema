# frozen_string_literal: true

class MoviesController < ApplicationController
  def index
    @movies = Movie.all.map do |movie|
      movie_params(movie)
    end
    render json: @movies
  end

  def show
    movie = Movie.find(params[:id])
    @transformed_movie = movie_params(movie)
    render json: @transformed_movie
  end

  def new
    Movie.create(movie_params)
  end

  def update
    movie = Movie.find(params[:id])
    movie.update(movie_params)
  end

  def delete
    movie = Movie.find(params[:id])
    movie.destroy
  end

  private

  def movie_params(movie)
    {
      id: movie.id,
      title: movie.title,
      length: movie.length,
      director: movie.director,
      genre: movie.genre
    }
  end
end
