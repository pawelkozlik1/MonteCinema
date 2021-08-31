# frozen_string_literal: true

class MoviesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    render json: Movies::Representers::Multiple.new(Movies::MovieRepository.new.all_movies).call
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

  def destroy
    Movies::UseCases::Delete.new(id: params[:id]).call
    render head: :no_content
  end

  private

  def movie_params
    params.permit(:title, :length, :director, :genre)
  end
end
