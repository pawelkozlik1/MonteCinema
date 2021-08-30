# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movies::UseCases::Delete do
  let!(:movie) { create :movie }

  subject(:delete_movies) { described_class.new(id: movie.id).call }

  describe '.call' do
    it 'deletes movie' do
      expect { delete_movies }.to change { Movie.count }.by(-1)
    end
  end
end
