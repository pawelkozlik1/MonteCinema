# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movies::Representers::Multiple do
  let(:movie_1) { create :movie }
  let(:movie_2) { create :movie }
  let(:movies) { [movie_1, movie_2] }

  describe '.call' do
    it 'returns proper hash' do
      expect(described_class.new(movies).call).to eq(
        [
          {
            id: movie_1.id,
            title: movie_1.title,
            length: movie_1.length,
            director: movie_1.director,
            genre: movie_1.genre
          },
          {
            id: movie_2.id,
            title: movie_2.title,
            length: movie_2.length,
            director: movie_2.director,
            genre: movie_2.genre
          },
        ]
      )
    end
  end
end
