# frozen_string_literal: true

class MoviesController < ApplicationController
  def index
    render json: Movies::Representers::Multiple.new.call
  end

  def show
    render json: Movies::Representers::Single.new(Movies::MovieRepository.new.find_movie(params[:id])).call
  end

  def create
    movie = Movies::UseCases::Create.new(params: movie_params).call

    if movie.valid?
      render json: Movies::Representers::Single.new(movie).call, status: :created
    else
      render json: movie.errors
    end
  end

  def update
    movie = Movies::UseCases::Update.new(params: movie_params, id: params[:id]).call
    render json: Movies::Representers::Single.new(movie).call
  end

  def delete
    Movies::UseCases::Delete.new(id: params[:id]).call
    render head: :no_content
  end

  private

  def movie_params
    params.permit(:title, :length, :director, :genre)
  end
end
