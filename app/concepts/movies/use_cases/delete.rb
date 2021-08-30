# frozen_string_literal: true

module Movies
  module UseCases
    class Delete
      def initialize(id:, repository: MovieRepository.new)
        @repository = repository
        @id = id
      end

      def call
        repository.delete_movie(id)
      end

      private

      attr_reader :repository, :id
    end
  end
end
