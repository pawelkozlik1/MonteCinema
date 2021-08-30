# frozen_string_literal: true

module Movies
  class MovieRepository
    attr_reader :adapter

    def initialize(adapter: Movie)
      @adapter = adapter
    end

    def all_movies
      adapter.all
    end

    def find_movie(id)
      adapter.find(id)
    end

    def create_movie(params)
      adapter.create(params)
    end

    def update_movie(id, params)
      movie = adapter.find(id)
      movie.update(params)
      movie
    end

    def delete_movie(id)
      adapter
        .find(id)
        .delete
    end
  end
end
