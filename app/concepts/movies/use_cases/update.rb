# frozen_string_literal: true

module Movies
  module UseCases
    class Update
      def initialize(params:, id:, repository: MovieRepository.new)
        @params = params
        @id = id
        @repository = repository
      end

      def call
        repository.update_movie(id, params)
      end

      private

      attr_reader :params, :id, :repository
    end
  end
end
