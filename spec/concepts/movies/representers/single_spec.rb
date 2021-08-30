# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movies::Representers::Single do
  let(:movie) { create :movie }

  describe '.call' do
    it 'returns proper hash' do
      expect(described_class.new(movie).call).to eq(
        {
          id: movie.id,
          title: movie.title,
          length: movie.length,
          director: movie.director,
          genre: movie.genre
        }
      )
    end
  end
end
