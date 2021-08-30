# frozen_string_literal: true

module Movies
  module Representers
    class Single
      def initialize(movie)
        @movie = movie
      end

      def call
        {
          id: movie.id,
          title: movie.title,
          length: movie.length,
          director: movie.director,
          genre: movie.genre
        }
      end

      private

      attr_reader :movie
    end
  end
end
