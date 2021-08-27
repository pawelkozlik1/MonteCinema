# frozen_string_literal: true

module Movies
  module UseCases
    class Create
      def initialize(params:, repository: Movies::MovieRepository.new)
        @repository = repository
        @params = params
      end

      def call
        repository.create_movie(params)
      end

      private

      attr_reader :repository, :params
    end
  end
end
