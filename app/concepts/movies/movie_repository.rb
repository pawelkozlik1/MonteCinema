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
      adapter
        .find(id)
        .update!(params)
    end

    def delete_movie(id)
      adapter
        .find(id)
        .destroy
    end
  end
end
