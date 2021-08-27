# frozen_string_literal: true

module Movies
  module UseCases
    class ShowIndex
      def initialize(repository: MovieRepository.new)
        @repository = repository
      end

      def call(id:)
        @repository.find_movie(id)
      end

      private

      attr_reader :repository
    end
  end
end
